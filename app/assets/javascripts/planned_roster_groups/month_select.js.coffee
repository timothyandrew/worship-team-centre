R = React.DOM

WorshipTeamCenter.MonthSelect = React.createClass
  displayName: "MonthSelect"

  getInitialState: -> { month: moment(@props.timestamp).month() + 1, year: moment(@props.timestamp).year(), name: @props.name || "[planned_roster_group][month]" }

  getMonth: ->
    year = @refs.year.getDOMNode().value
    month = @refs.month.getDOMNode().value
    moment("#{year}-#{month}")

  handleMonthChange: ->
    @setState(year: @refs.year.getDOMNode().value, month: @refs.month.getDOMNode().value)
    @props.onMonthChange()

  render: ->
    R.div {},
      R.select {id: "planned_roster_group_month_2i", onChange: @handleMonthChange, ref: "month", value: @state.month},
        R.option {value: "1"}, "January"
        R.option {value: "2"}, "February"
        R.option {value: "3"}, "March"
        R.option {value: "4"}, "April"
        R.option {value: "5"}, "May"
        R.option {value:"6"}, "June"
        R.option {value: "7"}, "July"
        R.option {value: "8"}, "August"
        R.option {value: "9"}, "September"
        R.option {value: "10"}, "October"
        R.option {value: "11"}, "November"
        R.option {value: "12"}, "December"

      R.select {id: "planned_roster_group_month_1i", onChange: @handleMonthChange, ref: "year", value: @state.year},
        R.option {value: "2014"}, "2014"
        R.option {value: "2015"} , "2015"
        R.option {value: "2016"} , "2016"
        R.option {value: "2017"} , "2017"
        R.option {value: "2018"} , "2018"
        R.option {value: "2019"} , "2019"

      R.input {name: @state.name, value: "#{@state.year}-#{@state.month}-01", className: "hidden", readOnly: true}
