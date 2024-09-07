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
