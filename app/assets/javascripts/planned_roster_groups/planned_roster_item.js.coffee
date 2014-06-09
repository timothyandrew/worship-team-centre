R = React.DOM

WorshipTeamCenter.PlannedRosterItem = React.createClass
  displayName: "PlannedRosterItem"

  getInitialState: -> {value: @props.value}

  handleChange: (event) ->
    @setState(value: event.target.value)

  render: ->
    R.div {className: "form-group"},
      R.label {className: "form-control"}, @props.role
      R.input {className: "form-control", name: "[planned_rosters][#{@props.i}][team][#{@props.type}][#{@props.role}]", value: @state.value, onChange: @handleChange}
