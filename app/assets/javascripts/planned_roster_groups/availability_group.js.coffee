R = React.DOM

WorshipTeamCenter.AvailabilityGroup = React.createClass
  displayName: "AvailabilityGroup"

  getInitialState: -> {}

  componentDidMount: ->
    @update()

  update: ->
    availabilities = _.map(@sundaysInMonth(), (date) ->
      {date: date}
    )
    @setState(availabilities: availabilities)

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
      WorshipTeamCenter.MonthSelect({onMonthChange: @update, ref: "month", timestamp: @props.month, name: "[availability_group][month]"})
      R.table {className: "table table-striped table-hover table-bordered table-responsive"},
        R.tr {},
          R.th {}, "Date"
          R.th {}, "Service"
          R.th {}, "Are You Available?"
        _.map @state.availabilities, (availability, i) ->
          R.tbody {},
            R.tr {},
              R.td {}, moment(availability.date).format("Do MMM YYYY")
              R.td {}, "Morning"
              R.td {},
                R.input {type: "checkbox", name: "[availabilities][#{i}][morning][#{moment(availability.date).format("YYYY-MM-DD")}]"}

            R.tr {},
              R.td {}, moment(availability.date).format("Do MMM YYYY")
              R.td {}, "Evening"
              R.td {},
                R.input {type: "checkbox", name: "[availabilities][#{i}][evening][#{moment(availability.date).format("YYYY-MM-DD")}]"}
