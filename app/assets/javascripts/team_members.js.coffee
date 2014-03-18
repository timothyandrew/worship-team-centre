window.WorshipTeamCenter ||= {}

class window.WorshipTeamCenter.TeamMembers extends window.WorshipTeamCenter.NestedResource
  setupDOM: =>
    @getRemoveItemAction = -> $(".remove-user-action")
    @addItemAction = $("#add-new-user-action")
    @addItemSelect = $("#add-new-user-select")
    @itemList = $("#team-members")

    @itemClass = 'team_membership_item'
    @itemDataAttrName = 'data-user-name'
    @itemDataAttrId = 'data-user-id'
    @removeItemClass = 'remove-user-action'
    @itemLabelClass = 'user-label'
    @getItemInputId = (index) -> "song_list_team_memberships_attributes_#{index}_user_id"
    @getItemInputName = (index) -> "song_list[team_memberships_attributes][#{index}][user_id]"
    @getItemWithDataAttrId = (id) -> $(".team_membership_item[data-user-id=#{id}]")
