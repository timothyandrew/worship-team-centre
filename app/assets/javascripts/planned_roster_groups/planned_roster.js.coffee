R = React.DOM

WorshipTeamCenter.PlannedRoster = React.createClass
  displayName: "PlannedRoster"

  render: ->
    R.div {},
      R.h1 {}, moment(@props.date).format("DD MMMM")

      R.h2 {}, "Morning"

      WorshipTeamCenter.PlannedRosterItem(type: "morning", role: "leader", value: (@props.team && @props.team.morning.leader), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "morning", role: "keyboard", value: (@props.team && @props.team.morning.keyboard), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "morning", role: "powerpoint", value: (@props.team && @props.team.morning.powerpoint), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "morning", role: "guitar", value: (@props.team && @props.team.morning.guitar), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "morning", role: "lead_guitar", value: (@props.team && @props.team.morning.lead_guitar), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "morning", role: "drums", value: (@props.team && @props.team.morning.drums), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "morning", role: "singing", value: (@props.team && @props.team.morning.singing), i: @props.i)


      R.h2 {}, "Evening"

      WorshipTeamCenter.PlannedRosterItem(type: "evening", role: "leader", value: (@props.team && @props.team.evening.leader), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "evening", role: "keyboard", value: (@props.team && @props.team.evening.keyboard), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "evening", role: "powerpoint", value: (@props.team && @props.team.evening.powerpoint), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "evening", role: "guitar", value: (@props.team && @props.team.evening.guitar), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "evening", role: "lead_guitar", value: (@props.team && @props.team.evening.lead_guitar), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "evening", role: "drums", value: (@props.team && @props.team.evening.drums), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "evening", role: "singing", value: (@props.team && @props.team.evening.singing), i: @props.i)

      R.input {name: "[planned_rosters][#{@props.i}][date]", value: moment(@props.date).format("YYYY-MM-DD"), className: "hidden" }
