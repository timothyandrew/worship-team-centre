class window.AvatarPicker
  constructor: (@modal, @formField, @preview) ->
    @images = $(@modal).find('.avatar-wrapper')
    @images.each (i, image) =>
      $(image).click(@imageSelected)

  imageSelected: (event) =>
    avatarUrl = $(event.target).attr('src')
    @formField.val(avatarUrl)
    @preview.attr('src', avatarUrl)
    @modal.modal('hide')
