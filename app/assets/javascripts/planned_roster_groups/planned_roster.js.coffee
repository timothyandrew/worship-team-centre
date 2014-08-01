R = React.DOM

WorshipTeamCenter.PlannedRoster = React.createClass
  displayName: "PlannedRoster"

  render: ->
    R.div {},
      R.h1 {}, moment(@props.date).format("DD MMMM")

      R.h2 {}, "Morning"
      R.h4 {},
        R.span {}, "Available: "
        if _.isEmpty(@props.available_users.morning)
          R.span {}, "None"
        else
          R.span {}, _.map(@props.available_users.morning, (user)-> user.name).join(", ")

      WorshipTeamCenter.PlannedRosterItem(type: "morning", role: "leader", value: (@props.team && @props.team.morning.leader), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "morning", role: "keyboard", value: (@props.team && @props.team.morning.keyboard), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "morning", role: "powerpoint", value: (@props.team && @props.team.morning.powerpoint), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "morning", role: "guitar", value: (@props.team && @props.team.morning.guitar), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "morning", role: "bass", value: (@props.team && @props.team.morning.bass), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "morning", role: "drums", value: (@props.team && @props.team.morning.drums), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "morning", role: "singing", value: (@props.team && @props.team.morning.singing), i: @props.i)

      R.h2 {}, "Evening"
      R.h4 {},
        R.span {}, "Available: "
        if _.isEmpty(@props.available_users.evening)
          R.span {}, "None"
        else
          R.span {}, _.map(@props.available_users.evening, (user)-> user.name).join(",")

      WorshipTeamCenter.PlannedRosterItem(type: "evening", role: "leader", value: (@props.team && @props.team.evening.leader), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "evening", role: "keyboard", value: (@props.team && @props.team.evening.keyboard), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "evening", role: "powerpoint", value: (@props.team && @props.team.evening.powerpoint), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "evening", role: "guitar", value: (@props.team && @props.team.evening.guitar), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "evening", role: "bass", value: (@props.team && @props.team.evening.bass), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "evening", role: "drums", value: (@props.team && @props.team.evening.drums), i: @props.i)
      WorshipTeamCenter.PlannedRosterItem(type: "evening", role: "singing", value: (@props.team && @props.team.evening.singing), i: @props.i)

      R.input {name: "[planned_rosters][#{@props.i}][date]", value: moment(@props.date).format("YYYY-MM-DD"), className: "hidden" }
