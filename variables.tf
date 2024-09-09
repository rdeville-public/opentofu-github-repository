# Repo settings related variables
# -----------------------------------------------------------------------------
variable "settings_name" {
  type        = string
  description = "String, the name of the repository."
}

variable "settings_description" {
  type        = string
  description = "String, a description of the repository."
}

variable "settings_homepage_url" {
  type        = string
  description = <<-EOM
  String, optional, URL of a page describing the project.
  EOM

  nullable = false
  default  = ""
}

variable "settings_visibility" {
  type        = string
  description = <<-EOM
  String, optional, Can be `public` or `private`.

  If your organization is associated with an enterprise account using GitHub
  Enterprise Cloud or GitHub Enterprise Server 2.20+, visibility can also be
  `internal`.
  EOM

  nullable = false
  default  = "private"
}

variable "settings_has_issues" {
  type        = bool
  description = <<-EOM
  Boolean, optional, set to `false` to disable the GitHub Issues features on
  the repository.
  EOM

  nullable = false
  default  = true
}

variable "settings_has_discussions" {
  type        = string
  description = <<-EOM
  Boolean, optional, set to `true` to enable the GitHub Discussion on the
  repository.
  EOM

  nullable = false
  default  = false
}

variable "settings_has_projects" {
  type        = bool
  description = <<-EOM
  Boolean, optional, set to `true` to enable the GitHub Project on the
  repository.

  Per the GitHub documentation when in an organization that has disabled
  repository projects it will default to `false`.
  If you specify `true` when it has been disabled it will return an error.
  EOM

  nullable = false
  default  = false
}

variable "settings_has_wiki" {
  type        = bool
  description = <<-EOM
  Boolean, optional, set to `true` to enable the GitHub Project on the
  repository.
  EOM

  nullable = false
  default  = false
}

variable "settings_is_template" {
  type        = bool
  description = <<-EOM
  Boolean, optional, set to `true`` to tell GitHub that this is a template
  repository.
  EOM

  nullable = false
  default  = false
}

variable "settings_allow_merge_commit" {
  type        = bool
  description = <<-EOM
  Boolean, optional, set to `false` to disable merge commits on the repository.
  EOM

  nullable = false
  default  = true
}

variable "settings_allow_squash_merge" {
  type        = bool
  description = <<-EOM
  Boolean, optional, set to `true` to enable squash merges on the repository.
  EOM

  nullable = false
  default  = false
}

variable "settings_allow_rebase_merge" {
  type        = bool
  description = <<-EOM
  Boolean, optional, set to `true` to enable rebase merges on the repository.
  EOM

  nullable = false
  default  = false
}

variable "settings_allow_auto_merge" {
  type        = bool
  description = <<-EOM
  Boolean, optional, set to `true`` to allow auto-merging pull requests on the
  repository.
  EOM

  nullable = false
  default  = false
}

variable "settings_squash_merge_commit_title" {
  type        = string
  description = <<-EOM
  String, optional, Can be `PR_TITLE`` or `COMMIT_OR_PR_TITLE`` for a default
  squash merge commit title.

  Applicable only if `settings_allow_squash_merge` is `true`.
  EOM

  nullable = false
  default  = "COMMIT_OR_PR_TITLE"
}

variable "settings_squash_merge_commit_message" {
  type        = string
  description = <<-EOM
  String, optional, can be `PR_BODY`, `COMMIT_MESSAGES`, or `BLANK` for a
  default squash merge commit message.

  Applicable only if `settings_allow_squash_merge` is true.
  EOM

  nullable = false
  default  = "PR_BODY"
}

variable "settings_merge_commit_title" {
  type        = string
  description = <<-EOM
  Can be `PR_TITLE` or `MERGE_MESSAGE` for a default merge commit title.

  Applicable only if `settings_allow_merge_commit` is `true`.
  EOM

  nullable = false
  default  = "PR_TITLE"
}

variable "settings_merge_commit_message" {
  type        = string
  description = <<-EOM
  Can be `PR_BODY`, `PR_TITLE`, or `BLANK` for a default merge commit message.

  Applicable only if `settings_allow_merge_commit` is `true`.
  EOM

  nullable = false
  default  = "PR_BODY"
}

variable "settings_delete_branch_on_merge" {
  type        = bool
  description = <<-EOM
  Boolean, optional, automatically delete head branch after a pull request is
  merged.

  Defaults to `true`
  EOM

  nullable = false
  default  = true
}

variable "settings_web_commit_signoff_required" {
  type        = bool
  description = <<-EOM
  Boolean, optional, require contributors to sign off on web-based commits.

  Defaults to `true`.
  EOM

  nullable = false
  default  = true
}

variable "settings_has_downloads" {
  type        = bool
  description = <<-EOM
  Boolean, optional, set to `true` to enable the (deprecated) downloads features
  on the repository.
  EOM

  nullable = false
  default  = false
}

variable "settings_auto_init" {
  type        = bool
  description = <<-EOM
  Boolean, optional, set to `true` to produce an initial commit in the repository.
  EOM

  nullable = false
  default  = false
}

variable "settings_gitignore_template" {
  type        = string
  description = <<-EOM
  String, optional, use the name of the template gitignore without the extension.
  For example, "Haskell".
  EOM

  nullable = false
  default  = ""
}

variable "settings_license_template" {
  type        = string
  description = <<-EOM
  String, optional, use the name of the template license without the extension.
  For example, "mit" or "mpl-2.0".
  EOM

  nullable = false
  default  = ""
}

variable "settings_archived" {
  type        = bool
  description = <<-EOM
  Boolean, optional, set to `true` to specifies if the repository should be
  archived.

  NOTE:  Currently, the API does not support unarchiving.

  Defaults to `false`.
  EOM

  nullable = false
  default  = false
}

variable "settings_archive_on_destroy" {
  type        = bool
  description = <<-EOM
  Boolean, optional, set to `true` to archive the repository instead of deleting
  on destroy.
  EOM

  nullable = false
  default  = false
}

variable "settings_pages" {
  type = object({
    source = optional(object({
      branch = string
      path   = optional(string, "/")
    }))
    build_type = optional(string, "workflow")
    cname      = optional(string)
  })
  description = <<-EOM
  Object, optional, the repository's GitHub Pages configuration.

  This object supports following arguments:
  * `source`: Object, optional, the source branch and directory for the rendered
    Pages site. The object supports the following arguments:
    * `branch`: String, the repository branch used to publish the site's source
      files (i.e. `main` or `gh-pages`).
    * `path`: String, optional, the repository directory from which the site
       publishes. Default to `/`.
  * `settings_build_type`: String, optional, the type of GitHub Pages site to build.
    Can be `legacy` or `workflow`, default to `workflow`.

    If you use `legacy` as build type you need to set the option `source`.
  * `settings_cname`: String, optional, the custom domain for the repository.
    This can only be set after the repository has been created. Default to
    `null`
  EOM

  nullable = false
  default  = {}
}


variable "settings_security_and_analysis" {
  type = object({
    advanced_security               = optional(string, "disabled")
    secret_scanning                 = optional(string, "disabled")
    secret_scanning_push_protection = optional(string, "disabled")
  })
  description = <<-EOM
  Object, optional, the repository's security and analysis configuration.
  The object supports following arguments:
  * `advanced_security`: String, optional, the advanced security configuration for
    the repository. Set to `enabled` to enable advanced security features on the
    repository. Can be `enabled` or `disabled`.

    Default to `disabled`.
  * `secret_scanning`: String, optional, The secret scanning configuration for
    the repository. Set to `enabled` to enable secret scanning on the repository.
    Can be `enabled` or `disabled`. If set to `enabled`, the repository's
    visibility must be `public` or `advanced_security` must also be set to `enabled`.

    Default to `disabled`.
  * `secret_scanning_push_protection`: String, optional, the secret scanning push
    protection configuration for the repository. Set to `enabled` to enable secret
    scanning push protection on the repository.
    Can be `enabled` or `disabled`. If set to `enabled`, the repository's
    visibility must be `public` or `advanced_security` must also be set to `enabled`.

    Default to `disabled`.
  EOM

  nullable = false
  default  = {}
}

variable "settings_topics" {
  type        = list(string)
  description = <<-EOM
  List of string, optional, the list of topics of the repository.
  EOM

  nullable = false
  default  = []
}
