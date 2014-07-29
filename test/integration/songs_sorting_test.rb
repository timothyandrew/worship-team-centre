require 'integration_test_helper'

class SongsSortingTest < ActionDispatch::IntegrationTest
  setup do
    @first_song = create(:song, name: "First Song", last_done_on: 5.days.ago)
    @second_song = create(:song, name: "Second Song", last_done_on: 6.days.ago)
    @third_song = create(:song, name: "Third Song", last_done_on: 7.days.ago)
    @leader_song = create(:song, name: "Fourth Song", last_done_on: 8.days.ago)

    login
  end

  test "allows sorting a list of songs by their 'Last Done At' date" do
    click_link "All Songs"

    click_link "Last Done On"
    assert page.has_content?(/Fourth Song.*Third Song.*Second Song.*First Song/)

    click_link "Last Done On"
    assert page.has_content?(/First Song.*Second Song.*Third Song.*Fourth Song/)
  end
end
