window.WorshipTeamCenter = {}

class window.WorshipTeamCenter.SongList
  add_new_song: =>
    form = $("form").first() # TODO: BAD!
    selected_option = $("#add-new-song-select").val()
    selected_song_name = $("#add-new-song-select :selected").text()
    $("#add-new-song-select :selected").remove()

    index = form.children().size()

    label_element = "<label for='song_list_song_list_items_attributes_#{index}_Song Name: #{selected_song_name}'>Song name: #{selected_song_name}</label>"
    hidden_element = "<input id='song_list_song_list_items_attributes_#{index}_song_id' name='song_list[song_list_items_attributes][#{index}][song_id]' type='hidden' value='#{selected_option}'>"

    form.append(label_element)
    form.append(hidden_element)