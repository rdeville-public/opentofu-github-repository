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
  # Convert to map for the resource
  teams = {
    for team, perm in transpose(local.team_perm) : team => one(perm)
  }

  # Assign highest privileged if user is present in multiple access level
  user_perm = {
    pull = setsubtract(
      var.users.pull, setunion(
        var.users.triage,
        var.users.push,
        var.users.maintain,
        var.users.admin
      )
    )
    triage = setsubtract(
      var.users.triage, setunion(
        var.users.push,
        var.users.maintain,
        var.users.admin
      )
    )
    push = setsubtract(
      var.users.push, setunion(
        var.users.maintain,
        var.users.admin
      )
    )
    maintain = setsubtract(
      var.users.maintain,
      var.users.admin
    )
    admin = var.users.admin
  }
  # Convert to map for the resource
  users = {
    for user, perm in transpose(local.user_perm) : user => one(perm)
  }
}
