window.WorshipTeamCenter ||= {}

class window.WorshipTeamCenter.NestedResource
  constructor: ->
    @index = $("form").first().children().size()
    @setupDOM()

  add_new_item: =>
    form = $("form").first() # TODO: BAD!
    selected_option = @addItemSelect.val()
    selected_item_name = @addItemSelect.find(":selected").text()
    @addItemSelect.find(":selected").remove()

    @index = @index + 1

    list_item_element = $("<li class='#{@itemClass}' #{@itemDataAttrId}='#{selected_option}'></li>")
    remove_item_element = "<a class='#{@removeItemClass}' href='javascript:void(0);' #{@itemDataAttrId}='#{selected_option}' #{@itemDataAttrId}='#{selected_item_name}'>Remove</a>"
    label_element = "<label class='#{@itemLabelClass}'>#{selected_item_name}</label>"
    hidden_element = "<input id='#{@getItemInputId(@index)}' name='#{@getItemInputName(@index)}' type='hidden' value='#{selected_option}'>"

    list_item_element.append(label_element)
    list_item_element.append(hidden_element)
    list_item_element.append(remove_item_element)

    @itemList.append(list_item_element)

    @bind_view()

  remove_item: (e) =>
    item_id = $(e.target).attr(@itemDataAttrId)
    item_name = $(e.target).attr(@itemDataAttrName)

    console.log @getItemWithDataAttrId(item_id)
    @getItemWithDataAttrId(item_id).remove()

    @addItemSelect.append($("<option>", {
      text: item_name,
      value: item_id
    }))

    @bind_view()

  bind_view: =>
    @getRemoveItemAction().unbind()
    @addItemAction.unbind()

    @getRemoveItemAction().click(@remove_item);
    
    if @addItemSelect.children().size() == 0
      @addItemAction.click(->)
    else
      @addItemAction.click(@add_new_item)

    @addItemSelect.trigger("chosen:updated")
