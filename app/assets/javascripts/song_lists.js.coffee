window.WorshipTeamCenter = {}

class window.WorshipTeamCenter.SongList
  constructor: ->
    @index = $("form").first().children().size()

  add_new_song: =>
    form = $("form").first() # TODO: BAD!
    selected_option = $("#add-new-song-select").val()
    selected_song_name = $("#add-new-song-select :selected").text()
    $("#add-new-song-select :selected").remove()

    @index = @index + 1

    song_list_item_element = $("<div class='song_list_item' data-song-id='#{selected_option}'></div>")
    remove_song_element = "<a class='remove-song-action' href='javascript:void(0);' data-song-id='#{selected_option}' data-song-name='#{selected_song_name}'>Remove</a>"
    label_element = "<label for='song_list_song_list_items_attributes_#{@index}_Song Name: #{selected_song_name}'>Song name: #{selected_song_name}</label>"
    hidden_element = "<input id='song_list_song_list_items_attributes_#{@index}_song_id' name='song_list[song_list_items_attributes][#{@index}][song_id]' type='hidden' value='#{selected_option}'>"

    song_list_item_element.append(label_element)
    song_list_item_element.append(hidden_element)
    song_list_item_element.append(remove_song_element)

    form.append(song_list_item_element)

    @rebind()

  remove_song: (e) =>
    song_id = $(e.target).data('song-id')
    song_name = $(e.target).data('song-name')

    $(".song_list_item[data-song-id=#{song_id}]").remove()

    $("#add-new-song-select").append($("<option>", {
      text: song_name,
      value: song_id
    }))

  rebind: =>
    $(".remove-song-action").unbind()
    $(".remove-song-action").click(@remove_song);
