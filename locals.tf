locals {
  # Assign highest privileged if team is present in multiple access level
  team_perm = {
    pull = setsubtract(
      var.teams.pull, setunion(
        var.teams.triage,
        var.teams.push,
        var.teams.maintain,
        var.teams.admin
      )
    )
    triage = setsubtract(
      var.teams.triage, setunion(
        var.teams.push,
        var.teams.maintain,
        var.teams.admin
      )
    )
    push = setsubtract(
      var.teams.push, setunion(
        var.teams.maintain,
        var.teams.admin
      )
    )
    maintain = setsubtract(
      var.teams.maintain,
      var.teams.admin
    )
    admin = var.teams.admin
  }

  # Convert to set for the resource
  teams = {
    for team, perm in transpose(local.team_perm) : team => one(perm)
  }
}
