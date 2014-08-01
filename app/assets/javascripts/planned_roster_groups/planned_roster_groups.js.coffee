R = React.DOM

WorshipTeamCenter.PlannedRosterGroups = React.createClass
  displayName: "PlannedRosterGroups"

  getInitialState: -> { rosters: @props.rosters }

  componentDidMount: ->
    if _.isEmpty(@props.rosters)
      @updateRosters()

  updateRosters: ->
    rosters = _.map(@sundaysInMonth(), (date) ->
      {date: date}
    )
    @setState(rosters: rosters)

  sundaysInMonth: ->
    year = moment(@props.month).year()
    month = moment(@props.month).month() + 1
    sundays = []
    for i in [1..moment(@props.month).daysInMonth()]
      day = moment("#{year}-#{month}-#{i}")
      if day.format("ddd") == "Sun"
        sundays.push day
    sundays

  render: ->
    R.div {},
      _.map @state.rosters, (roster, i) ->
        WorshipTeamCenter.PlannedRoster(_.extend(roster, {i: i}))
