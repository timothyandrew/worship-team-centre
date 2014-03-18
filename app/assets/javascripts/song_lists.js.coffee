window.WorshipTeamCenter ||= {}

class window.WorshipTeamCenter.SongList extends window.WorshipTeamCenter.NestedResource
  setupDOM: =>
    @getRemoveItemAction = -> $(".remove-song-action")
    @addItemAction = $("#add-new-song-action")
    @addItemSelect = $("#add-new-song-select")
    @itemList = $("#song-list")

    @itemClass = 'song_list_item'
    @itemDataAttrName = 'data-song-name'
    @itemDataAttrId = 'data-song-id'
    @removeItemClass = 'remove-song-action'
    @itemLabelClass = 'song-label'
    @getItemInputId = (index) -> "song_list_song_list_items_attributes_#{index}_song_id"
    @getItemInputName = (index) -> "song_list[song_list_items_attributes][#{index}][song_id]"
    @getItemWithDataAttrId = (id) -> $(".song_list_item[data-song-id=#{id}]")
