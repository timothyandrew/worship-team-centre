require 'integration_test_helper'

class SongListIntegrationTest < ActionDispatch::IntegrationTest
  setup do
    @first_user = create(:user, name: "First User")
    @second_user = create(:user, name: "Second User")
    @third_user = create(:user, name: "Third User")
    @leader_user = create(:user, name: "Leader User")

    @first_song = create(:song, name: "First Song")
    @second_song = create(:song, name: "Second Song")
    @third_song = create(:song, name: "Third Song")
    login
  end

  def create_song_list
    click_link("New Worship Set")
    fill_in("song_list_done_on", with: "2014-07-25")
    fill_in("song_list_theme", with: "This is a theme")
    select("Evening", from: "song_list_service")
    select_from_chosen("Leader User", from: "song_list_leader_id")

    select_from_chosen("Second Song", from: "add-new-song-select")
    click_link("add-new-song-action")
    select_from_chosen("Third Song", from: "add-new-song-select")
    click_link("add-new-song-action")

    select_from_chosen("Second User", from: "add-new-user-select")
    click_link("add-new-user-action")
    select_from_chosen("Third User", from: "add-new-user-select")
    click_link("add-new-user-action")

    click_button "Save Worship Set"
  end

  test "allows creating song lists" do
    create_song_list

    visit song_lists_path
    assert page.has_no_content? "First Song"
    assert page.has_content? "Second Song"
    assert page.has_content? "Third Song"

    assert page.has_no_content? "First"
    assert page.has_content? "Second"
    assert page.has_content? "Third"
    assert page.has_content? "Leader"

    assert page.has_no_content? "Morning"
    assert page.has_content? "Evening"
    assert page.has_no_content? "Other"

    assert page.has_content? "July 25, 2014"
    assert page.has_content? "This is a theme"
  end

  test "allows updating the songs and team members for a song list" do
    create_song_list
    visit song_lists_path
    click_link "Edit"

    find(".song_list_item[data-song-id=\"#{@second_song.id}\"]").click_link("Remove")
    select_from_chosen("First Song", from: "add-new-song-select")
    click_link("add-new-song-action")

    find(".team_membership_item[data-user-id=\"#{@second_user.id}\"]").click_link("Remove")
    select_from_chosen("First User", from: "add-new-user-select")
    click_link("add-new-user-action")

    click_button "Save Worship Set"

    assert page.has_content? "First Song"
    assert page.has_no_content? "Second Song"
    assert page.has_content? "Third Song"

    assert page.has_content? "First"
    assert page.has_no_content? "Second"
    assert page.has_content? "Third"
  end

end
