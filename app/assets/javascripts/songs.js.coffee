window.WorshipTeamCenter ||= {}

class window.WorshipTeamCenter.Song
  constructor: (@element) ->
  	this

  matches: (searchTerm) =>
  	@name().match(new RegExp(searchTerm, "i"))

  name: =>
  	$(@element).find(".song-name").text()

  show: =>
  	$(@element).show()

  hide: =>
  	$(@element).hide()