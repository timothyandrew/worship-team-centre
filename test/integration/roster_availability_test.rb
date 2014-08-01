require 'integration_test_helper'

class RosterAvailabilityTest < ActionDispatch::IntegrationTest
  setup do
    @first_user = create(:user, name: "Bill", password: "testing")
    @second_user = create(:user, name: "Bob", password: "testing")

    login(@first_user)
  end

  test "show available users while creating a roster" do
    click_link "Give Your Availability"

    select "October", from: "planned_roster_group_month_2i"
    select "2018", from: "planned_roster_group_month_1i"

    find_field("[availabilities][0][morning][2018-10-14]").click
    find_field("[availabilities][0][evening][2018-10-14]").click

    find_field("[availabilities][1][morning][2018-10-21]").click
    find_field("[availabilities][1][evening][2018-10-21]").click

    click_button("Save")

    logout
    login(@second_user)

    click_link "Give Your Availability"

    select "October", from: "planned_roster_group_month_2i"
    select "2018", from: "planned_roster_group_month_1i"

    find_field("[availabilities][0][morning][2018-10-14]").click
    find_field("[availabilities][1][evening][2018-10-21]").click
    find_field("[availabilities][2][morning][2018-10-28]").click

    click_button("Save")

    click_link "Roster Planner"
    click_link "Create Roster"

    select "October", from: "planned_roster_group_month_2i"
    select "2018", from: "planned_roster_group_month_1i"

    click_button "Continue"

    assert page.has_content? "14 October\nMorning\nAvailable: Bill, Bob"
    assert page.has_content? "21 October\nMorning\nAvailable: Bill"
    assert page.has_content? "28 October\nMorning\nAvailable: Bob"

    assert page.has_content? "Evening\nAvailable: None"
    assert page.has_content? "Evening\nAvailable: Bill"
    assert page.has_content? "Evening\nAvailable: Bill, Bob"

    click_button "Save"
  end
end

