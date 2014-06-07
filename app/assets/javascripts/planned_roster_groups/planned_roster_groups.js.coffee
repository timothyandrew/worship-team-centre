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
    year = @refs.month.getMonth().year()
    month = @refs.month.getMonth().month() + 1
    sundays = []
    for i in [1..@refs.month.getMonth().daysInMonth()]
      day = moment("#{year}-#{month}-#{i}")
      if day.format("ddd") == "Sun"
        sundays.push day
    sundays

  render: ->
    R.div {},
      WorshipTeamCenter.MonthSelect({onMonthChange: @updateRosters, ref: "month"})
      _.map @state.rosters, (roster, i) ->
        console.log roster
        WorshipTeamCenter.PlannedRoster(_.extend(roster, {i: i}))
