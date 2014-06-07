R = React.DOM

WorshipTeamCenter.PlannedRoster = React.createClass
  displayName: "PlannedRoster"

  render: ->
    R.div {},
      R.h1 {}, moment(@props.date).format("DD MMMM")

      R.h2 {}, "Morning"

      R.div {className: "form-group"},
        R.label {className: "form-control"}, "Leader"
        R.input {className: "form-control", name: "[planned_rosters][#{@props.i}][team][morning][leader]", value: (@props.team && @props.team.morning.leader)}

      R.div {className: "form-group"},
        R.label {className: "form-control"}, "Keyboard"
        R.input {className: "form-control", name: "[planned_rosters][#{@props.i}][team][morning][keyboard]", value: (@props.team && @props.team.morning.keyboard)}

      R.div {className: "form-group"},
        R.label {className: "form-control"}, "Powerpoint"
        R.input {className: "form-control", name: "[planned_rosters][#{@props.i}][team][morning][powerpoint]", value: (@props.team && @props.team.morning.powerpoint)}

      R.div {className: "form-group"},
        R.label {className: "form-control"}, "Guitar"
        R.input {className: "form-control", name: "[planned_rosters][#{@props.i}][team][morning][guitar]", value: (@props.team && @props.team.morning.guitar)}

      R.div {className: "form-group"},
        R.label {className: "form-control"}, "Lead Guitar"
        R.input {className: "form-control", name: "[planned_rosters][#{@props.i}][team][morning][lead_guitar]", value: (@props.team && @props.team.morning.lead_guitar)}

      R.div {className: "form-group"},
        R.label {className: "form-control"}, "Drums"
        R.input {className: "form-control", name: "[planned_rosters][#{@props.i}][team][morning][drums]", value: (@props.team && @props.team.morning.drums)}

      R.div {className: "form-group"},
        R.label {className: "form-control"}, "Singing"
        R.input {className: "form-control", name: "[planned_rosters][#{@props.i}][team][morning][singing]", value: (@props.team && @props.team.morning.singing)}



      R.h2 {}, "Evening"

      R.div {className: "form-group"},
        R.label {className: "form-control"}, "Leader"
        R.input {className: "form-control", name: "[planned_rosters][#{@props.i}][team][evening][leader]", value: (@props.team && @props.team.evening.leader)}

      R.div {className: "form-group"},
        R.label {className: "form-control"}, "Keyboard"
        R.input {className: "form-control", name: "[planned_rosters][#{@props.i}][team][evening][keyboard]", value: (@props.team && @props.team.evening.keyboard)}

      R.div {className: "form-group"},
        R.label {className: "form-control"}, "Powerpoint"
        R.input {className: "form-control", name: "[planned_rosters][#{@props.i}][team][evening][powerpoint]", value: (@props.team && @props.team.evening.powerpoint)}

      R.div {className: "form-group"},
        R.label {className: "form-control"}, "Guitar"
        R.input {className: "form-control", name: "[planned_rosters][#{@props.i}][team][evening][guitar]", value: (@props.team && @props.team.evening.guitar)}

      R.div {className: "form-group"},
        R.label {className: "form-control"}, "Lead Guitar"
        R.input {className: "form-control", name: "[planned_rosters][#{@props.i}][team][evening][lead_guitar]", value: (@props.team && @props.team.evening.lead_guitar)}

      R.div {className: "form-group"},
        R.label {className: "form-control"}, "Drums"
        R.input {className: "form-control", name: "[planned_rosters][#{@props.i}][team][evening][drums]", value: (@props.team && @props.team.evening.drums)}

      R.div {className: "form-group"},
        R.label {className: "form-control"}, "Singing"
        R.input {className: "form-control", name: "[planned_rosters][#{@props.i}][team][evening][singing]", value: (@props.team && @props.team.evening.singing)}

      R.div {className: "form-group"},
        R.input {className: "hidden", name: "[planned_rosters][#{@props.i}][date]", value: moment(@props.date).format("YYYY-MM-DD"), readOnly: true}

