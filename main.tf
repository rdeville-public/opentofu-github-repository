# Manage basic settings of a Github repository.
resource "github_repository" "this" {
  name         = var.settings_name
  description  = var.settings_description
  homepage_url = var.settings_homepage_url

  visibility                  = var.settings_visibility
  has_issues                  = var.settings_has_issues
  has_discussions             = var.settings_has_discussions
  has_projects                = var.settings_has_projects
  has_wiki                    = var.settings_has_wiki
  is_template                 = var.settings_is_template
  allow_merge_commit          = var.settings_allow_merge_commit
  allow_squash_merge          = var.settings_allow_squash_merge
  allow_rebase_merge          = var.settings_allow_rebase_merge
  allow_auto_merge            = var.settings_allow_auto_merge
  squash_merge_commit_title   = var.settings_squash_merge_commit_title
  squash_merge_commit_message = var.settings_squash_merge_commit_message
  merge_commit_title          = var.settings_merge_commit_title
  merge_commit_message        = var.settings_merge_commit_message
  delete_branch_on_merge      = var.settings_delete_branch_on_merge
  web_commit_signoff_required = var.settings_web_commit_signoff_required
  has_downloads               = var.settings_has_downloads
  auto_init                   = var.settings_auto_init
  gitignore_template          = var.settings_gitignore_template
  license_template            = var.settings_license_template
  archived                    = var.settings_archived
  archive_on_destroy          = var.settings_archive_on_destroy
  topics                      = var.settings_topics

  security_and_analysis {
    advanced_security {
      status = var.settings_security_and_analysis.advanced_security
    }
    secret_scanning {
      status = var.settings_security_and_analysis.secret_scanning
    }
    secret_scanning_push_protection {
      status = var.settings_security_and_analysis.secret_scanning_push_protection
    }
  }

  pages {

    build_type = var.settings_pages.build_type
    cname      = var.settings_pages.cname

    dynamic "source" {
      for_each = var.settings_pages.source != null ? var.settings_pages.source : {}

      content {
        branch = var.settings_pages.source.branch
        path   = var.settings_pages.source.path
      }
    }
  }
}

# Manage ruletsets of an organization.
resource "github_repository_ruleset" "this" {
  for_each = var.ruleset

  repository = github_repository.this.name

  name        = each.key
  target      = each.value.target
  enforcement = each.value.enforcement

  dynamic "bypass_actors" {
    for_each = each.value.bypass_actors != null ? each.value.bypass_actors : []

    content {
      actor_id    = bypass_actors.value.actor_id
      actor_type  = bypass_actors.value.actor_type
      bypass_mode = bypass_actors.value.bypass_mode
    }
  }

  dynamic "conditions" {
    for_each = each.value.conditions != null ? [each.value.conditions] : []

    content {
      ref_name {
        include = conditions.value.ref_name.include
        exclude = conditions.value.ref_name.exclude
      }
    }
  }

  rules {
    creation                = each.value.rules.creation
    update                  = each.value.rules.update
    deletion                = each.value.rules.deletion
    non_fast_forward        = each.value.rules.non_fast_forward
    required_linear_history = each.value.rules.required_linear_history
    required_signatures     = each.value.rules.required_signatures

    dynamic "required_deployments" {
      for_each = each.value.rules.required_deployments != null ? [each.value.rules.required_deployments] : []

      content {
        required_deployment_environments = required_deployments.value
      }
    }

    dynamic "branch_name_pattern" {
      for_each = each.value.target == "branch" && each.value.rules.name_pattern != null ? [each.value.rules.name_pattern] : []

      content {
        name     = branch_name_pattern.value.name
        negate   = branch_name_pattern.value.negate
        operator = branch_name_pattern.value.operator
        pattern  = branch_name_pattern.value.pattern
      }
    }

    dynamic "tag_name_pattern" {
      for_each = each.value.target == "tag" && each.value.rules.name_pattern != null ? [each.value.rules.name_pattern] : []

      content {
        name     = tag_name_pattern.value.name
        negate   = tag_name_pattern.value.negate
        operator = tag_name_pattern.value.operator
        pattern  = tag_name_pattern.value.pattern
      }
    }

    dynamic "commit_author_email_pattern" {
      for_each = each.value.rules.commit_author_email_pattern != null ? [each.value.rules.commit_author_email_pattern] : []

      content {
        name     = commit_author_email_pattern.value.name
        operator = commit_author_email_pattern.value.operator
        pattern  = commit_author_email_pattern.value.pattern
        negate   = commit_author_email_pattern.value.negate
      }
    }

    dynamic "committer_email_pattern" {
      for_each = each.value.rules.committer_email_pattern != null ? [each.value.rules.committer_email_pattern] : []

      content {
        name     = committer_email_pattern.value.name
        operator = committer_email_pattern.value.operator
        pattern  = committer_email_pattern.value.pattern
        negate   = committer_email_pattern.value.negate
      }
    }

    dynamic "commit_message_pattern" {
      for_each = each.value.rules.commit_message_pattern != null ? [each.value.rules.commit_message_pattern] : []

      content {
        name     = commit_message_pattern.value.name
        operator = commit_message_pattern.value.operator
        pattern  = commit_message_pattern.value.pattern
        negate   = commit_message_pattern.value.negate
      }
    }

    dynamic "pull_request" {
      for_each = each.value.rules.pull_request != null ? [each.value.rules.pull_request] : []

      content {
        dismiss_stale_reviews_on_push     = pull_request.value.dismiss_stale_reviews_on_push
        require_code_owner_review         = pull_request.value.require_code_owner_review
        require_last_push_approval        = pull_request.value.require_last_push_approval
        required_approving_review_count   = pull_request.value.required_approving_review_count
        required_review_thread_resolution = pull_request.value.required_review_thread_resolution
      }
    }

    dynamic "required_status_checks" {
      for_each = each.value.rules.required_status_checks != null ? [each.value.rules.required_status_checks] : []

      content {
        required_check {
          context        = required_status_checks.value.context
          integration_id = required_status_checks.value.integration_id
        }
        strict_required_status_checks_policy = required_status_checks.value.strict_required_status_checks_policy
      }
    }
  }
}

# Manage action variables of repository
resource "github_actions_variable" "this" {
  for_each = var.actions_variables

  repository = github_repository.this.name

  variable_name = each.key
  value         = each.value
}

# Manage action secrets of repository
resource "github_actions_secret" "this" {
  for_each = var.actions_secrets

  repository = github_repository.this.name

  secret_name     = each.key
  encrypted_value = base64encode(each.value)
}

# Manage issues labels of the repository.
resource "github_issue_labels" "this" {
  repository = github_repository.this.id

  dynamic "label" {
    for_each = var.issues_labels

    content {
      name        = label.key
      color       = label.value.color
      description = label.value.description
    }
  }
}

# Manage team access level to the repository
resource "github_team_repository" "this" {
  for_each = local.teams

  repository = github_repository.this.name
  team_id    = each.key
  permission = each.value
}
