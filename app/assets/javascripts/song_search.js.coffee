window.WorshipTeamCenter ||= {}

class window.WorshipTeamCenter.SongSearch
  constructor: (@songs) ->
    $("#search-songs").keyup(@search)

  searchTerm: =>
    $("#search-songs").val()    

  search: =>
    _(@songs).each (song) =>
      if song.matches(@searchTerm())
        song.show()
      else
        song.hide()

