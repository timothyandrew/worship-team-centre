require 'test_helper'
require 'capybara/rails'

Capybara.default_driver = :selenium
Capybara.javascript_driver = :selenium
DatabaseCleaner.strategy = :truncation

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  self.use_transactional_fixtures = false

  setup do
    Capybara.default_wait_time = 5
    DatabaseCleaner.start
  end

  teardown do
    Capybara.reset_sessions!
    DatabaseCleaner.clean
  end

  def login(user = nil)
    user ||= create(:user, password: "testing", email: "test@test.com")
    visit(new_user_session_path)
    fill_in('Email Address', :with => user.email)
    fill_in('Password', :with => 'testing')
    click_button("Sign in")
  end

  def logout
    Capybara.reset_sessions!
  end

  def select_from_chosen(item_text, options)
    field = find_field(options[:from], visible: false)
    option_value = page.evaluate_script("$(\"##{field[:id]} option:contains('#{item_text}')\").val()")
    page.execute_script("$('##{field[:id]}').val('#{option_value}')")
    page.execute_script("$('##{field[:id]}').trigger('chosen:updated').trigger('change')")
  end
end
