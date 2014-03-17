class window.AvatarPicker
  constructor: (@modal, @formField) ->
    @images = $(@modal).find('.avatar-wrapper')
    @images.each (i, image) =>
      $(image).click(@imageSelected)

  imageSelected: (event) =>
    avatarUrl = $(event.target).attr('src')
    @formField.val(avatarUrl)
    @modal.modal('hide')
