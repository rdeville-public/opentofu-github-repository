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

# Repository Rules Set variables
# ------------------------------------------------------------------------
variable "ruleset" {
  # Key is the name of the ruleset
  type = map(object({
    target      = string
    enforcement = optional(string, "active")
    bypass_actors = optional(list(object({
      actor_id    = number
      actor_type  = optional(string)
      bypass_mode = optional(string, "pull_request")
    })))
    conditions = optional(object({
      ref_name = object({
        include = optional(list(string), [])
        exclude = optional(list(string), [])
      })
    }))
    rules = object({
      creation                = optional(bool, true)
      update                  = optional(bool, true)
      deletion                = optional(bool, true)
      non_fast_forward        = optional(bool, true)
      required_linear_history = optional(bool, true)
      required_signatures     = optional(bool, true)
      required_deployments    = optional(list(string), [])
      name_pattern = optional(object({
        name     = string
        operator = string
        pattern  = string
        negate   = optional(bool, false)
      }))
      commit_author_email_pattern = optional(object({
        name     = string
        operator = string
        pattern  = string
        negate   = optional(bool, false)
      }))
      committer_email_pattern = optional(object({
        name     = string
        operator = string
        pattern  = string
        negate   = optional(bool, false)
      }))
      commit_message_pattern = optional(object({
        name     = string
        operator = string
        pattern  = string
        negate   = optional(bool, false)
      }))
      pull_request = optional(object({
        dismiss_stale_reviews_on_push     = optional(bool, false)
        require_code_owner_review         = optional(bool, true)
        require_last_push_approval        = optional(bool, false)
        required_approving_review_count   = optional(number, 1)
        required_review_thread_resolution = optional(bool, false)
      }))
      required_status_checks = optional(object({
        required_check = object({
          context        = string
          integration_id = optional(number)
        })
        strict_required_status_checks_policy = optional(bool, true)
      }))
    })
  }))
  description = <<-EOM
  Map of object, where key is the name of the ruleset.
  Object define ruleset apply to branch ONLY, with the following arguments:
  * `target`: String, define the targe on which will apply the rules. Possible
    values are `branch` and `tag`

  * `enforcement`: Optional, String, enforcement type, one of `disabled`,
    `active` or `evaluate`. Default set to `active`.

    Note: evaluate is currently only supported for owners of type organization.

  * `bypass_actors`: List of object, optional, the actors that can bypass the
    rules in this ruleset, with the following arguments:

    * `actor_id`: Number, the ID of the actor that can bypass a ruleset.

    * `actor_type`: String, optional, the type of actor that can bypass a ruleset.

      Can be one of: `RepositoryRole`, `Team`, `Integration`, `OrganizationAdmin`.

      Note: at the time of writing this, the following actor types correspond to
      the following actor IDs:

        * OrganizationAdmin -> 1

      RepositoryRole (This is the actor type, the following are the base
      repository roles and their associated IDs.)

        * maintain -> 2
        * write -> 4
        * admin -> 5

    * `bypass_mode`: String, optional, when the specified actor can bypass the ruleset.
      pull_request means that an actor can only bypass rules on pull requests.

      Can be one of: `always`, `pull_request`. Default to `pull_request`.

  * `conditions`: Object, parameters for an organization ruleset condition.
    `ref_name` is required alongside one of `repository_name` or `repository_id`.

    * `ref_name`: Object, with the following arguments

      * `exclude`: List of string, array of ref names or patterns to exclude.
        The condition will not pass if any of these patterns match.
      * `include`: List of string, array of ref names or patterns to include.
         One of these patterns must match for the condition to pass.
         Also accepts `~DEFAULT_BRANCH` to include the default branch or
         `~ALL` to include all branches.

  * `rules`: Object, which define rules within the ruleset. Object
    support following arguments:

    * `creation`: Boolean, optional, only allow users with bypass permission to
      create matching refs. Default to `true`

    * `update`: Boolean, optional, only allow users with bypass permission to
      update matching refs. Default `true`

    * `deletion`: Boolean, optional, only allow users with bypass permissions to
      delete matching refs. Default to `true`

    * `non_fast_forward`: Prevent users with push access from force pushing
      to branches. Default to `true`

    * `required_linear_history`: Boolean, optional, prevent merge commits from
       being pushed to matching branches. Default to `true`

    * `required_signatures`: Boolean, optional, commits pushed to matching
       branches must have verified signatures. Default to `true`

    * `required_deployments`: List of string, optional, the environments that
      must be successfully deployed to before branches can be merged.
      Default to `[]`

    * `name_pattern`: Object, parameters to be used for the branch_name_pattern
      rule. This rule only applies to repositories within an enterprise, it
      cannot be applied to repositories owned by individuals or regular
      organizations. This object support following arguments:

      * `name`: String How this rule will appear to users.
      * `operator`: String, the operator to use for matching. Can be one of:
        starts_with, ends_with, contains, regex.
      * `pattern`: String, the pattern to match with.
      * `negate`: Boolean, optional, If true, the rule will fail if the pattern
        matches. Default `false`.

    * `commit_author_email_pattern`: Object, optional, parameters to be used for
      the commit_author_email_pattern rule. This rule only applies to
      repositories within an enterprise, it cannot be applied to repositories
      owned by individuals or regular organizations. This object support
      following arguments:

      * `name`: String How this rule will appear to users.
      * `operator`: String, the operator to use for matching. Can be one of:
        starts_with, ends_with, contains, regex.
      * `pattern`: String, the pattern to match with.
      * `negate`: Boolean, optional, If true, the rule will fail if the pattern
        matches. Default `false`.

    * `committer_email_pattern`: Object, optional, parameters to be used for
      the commit_author_email_pattern rule. This rule only applies to
      repositories within an enterprise, it cannot be applied to repositories
      owned by individuals or regular organizations.This object support
      following arguments:

      * `name`: String How this rule will appear to users.
      * `operator`: String, the operator to use for matching. Can be one of:
        starts_with, ends_with, contains, regex.
      * `pattern`: String, the pattern to match with.
      * `negate`: Boolean, optional, If true, the rule will fail if the pattern
        matches. Default `false`.

    * `commit_message_pattern`: Object, optional, parameters to be used for the
      commit_message_pattern rule. This rule only applies to repositories
      within an enterprise, it cannot be applied to repositories owned by
      individuals or regular organizations.This object support following
      arguments:

      * `name`: String How this rule will appear to users.
      * `operator`: String, the operator to use for matching. Can be one of:
        starts_with, ends_with, contains, regex.
      * `pattern`: String, the pattern to match with.
      * `negate`: Boolean, optional, If true, the rule will fail if the pattern
        matches. Default `false`.

    * `pull_request`: Object, optional, require all commits be made to a
       non-target branch and submitted via a pull request before they can be
       merged. This object support following arguments:

      * `dismiss_stale_reviews_on_push`: Boolean, optional, new reviewable commits
        pushed will dismiss previous pull request review approvals.
        Defaults to `false`.

      * `require_code_owner_review`: Boolean, optional, require an approving
        review in pull requests that modify files that have a designated code
        owner. Defaults to `true`.

      * `require_last_push_approval`: Boolea, optional, whether the most recent
        reviewable push must be approved by someone other than the person who
        pushed it. Defaults to `false`.

      * `required_approving_review_count`: Number, optional, the number of
        approving reviews that are required before a pull request can be merged.
        Defaults to `1`.

      * `required_review_thread_resolution`: Boolea, optional, all conversations
        on code must be resolved before a pull request can be merged.
        Defaults to `false`.

    * `required_status_checks`: list(Object), optional, choose which status checks
      must pass before branches can be merged into a branch that matches this rule.
      When enabled, commits must first be pushed to another branch, then merged
      or pushed directly to a branch that matches this rule after status checks
      have passed. This object support following arguments:

      * `required_check`: Object, optional, status checks that are required.
        Several can be defined.

        * `context`: String, the status check context name that must be present
          on the commit.

        * `integration_id`: Number, optional, integration ID that this status
          check must originate from.

      * `strict_required_status_checks_policy`: Boolean, optioanl, whether pull
         requests targeting a matching branch must be tested with the latest code.
         This setting will not take effect unless at least one status check is enabled.
         Defaults to false.

  EOM

  nullable = false
  default  = {}
}

# Repository Actions Variables variables
# ------------------------------------------------------------------------
variable "actions_variables" {
  # Key is the name of the action variable
  type        = map(string)
  description = <<-EOM
  A map of string where key is the name of the variable and value is the value
  of the actions Variables
  EOM

  nullable = false
  default  = {}
}

# Repository Actions Secrets variables
# ------------------------------------------------------------------------
variable "actions_secrets" {
  # Key is the name of the action variable
  type        = map(string)
  description = <<-EOM
  A map of string where key is the name of the secret and value is the value
  of the actions Secrets
  EOM

  nullable = false
  default  = {}
}

# Repository Issues Labels variables
# ------------------------------------------------------------------------
variable "issues_labels" {
  # Key is the name of the action variable
  type = map(object({
    color       = string
    description = string
  }))
  description = <<-EOM
  A map of object, where key is the name of the labels. Object support following
  attributes :

  * `color`: String, A 6 character hex code, **without the leading #**,
    identifying the color of the label.
  * `description`: String, A short description of the label
  EOM

  default = null
}

# Repository Teams variables
# ------------------------------------------------------------------------
variable "teams" {
  type = object({
    pull     = optional(set(string), [])
    triage   = optional(set(string), [])
    push     = optional(set(string), [])
    maintain = optional(set(string), [])
    admin    = optional(set(string), [])
  })
  description = <<-EOM
  Object with following attributes :

  * `pull`
  * `triage`
  * `push`
  * `maintain`
  * `admin`

  All attributes are set of string, optional, with default value `[]`.

  Above list is provided in order of access capacity, such that `pull` have more
  access than `triage` which have more access than `push`, etc.

  Elements of the sets are ID (or name) of teams with access to the repository
  corresponding to its attribute.

  For instance:

  ```hcl
  teams = {
    pull = [
      "foo",
    ]
    admin = [
      "bar",
    ]
  }
  ```

  Provide `pull` access to the team `foo` and `admin` access to the team `bar`.

  If a team is set in two (or more) attributes (i.e. access levels), then the
  higher access level is applied.

  This can be usefull for instance when providing temporarly greater access
  level to a team while minimizing the amount of action needed.

  For instance:

  ```hcl
  teams = {
    pull = [
      "foo",
      "bar",
    ]
    admin = [
      "bar",
      "baz",
    ]
  }
  ```

  Provide `pull` access to the team `foo` and `admin` access to the teams `bar`
  and `baz`

  EOM

  nullable = false
  default  = {}
}

variable "users" {
  type = object({
    pull     = optional(set(string), [])
    triage   = optional(set(string), [])
    push     = optional(set(string), [])
    maintain = optional(set(string), [])
    admin    = optional(set(string), [])
  })
  description = <<-EOM
  Object with following attributes :

  * `pull`
  * `triage`
  * `push`
  * `maintain`
  * `admin`

  All attributes are set of string, optional, with default value `[]`.

  Above list is provided in order of access capacity, such that `pull` have more
  access than `triage` which have more access than `push`, etc.

  Elements of the sets are ID (or name) of users with access to the repository
  corresponding to its attribute.

  For instance:

  ```hcl
  users = {
    pull = [
      "foo",
    ]
    admin = [
      "bar",
    ]
  }
  ```

  Provide `pull` access to the user `foo` and `admin` access to the user `bar`.

  If a user is set in two (or more) attributes (i.e. access levels), then the
  higher access level is applied.

  This can be usefull for instance when providing temporarly greater access
  level to a user while minimizing the amount of action needed.

  For instance:

  ```hcl
  users = {
    pull = [
      "foo",
      "bar",
    ]
    admin = [
      "bar",
      "baz",
    ]
  }
  ```

  Provide `pull` access to the user `foo` and `admin` access to the users `bar`
  and `baz`

  EOM

  nullable = false
  default  = {}
}

# Repository Webhook variables
# ------------------------------------------------------------------------
variable "webhooks" {
  # Key is just a human readabl identifier for the webhook
  type = map(object({
    events       = list(string)
    url          = string
    content_type = string
    secret       = optional(string)
    insecure_ssl = optional(bool, false)
    active       = optional(bool, true)
  }))
  description = <<-EOM
  Map of object, where key is just a human readable identifier. Object support
  following attributes :

  * `events`: List of string, a list of events which should trigger the webhook.
    See a [list of available events](https://developer.github.com/v3/activity/events/types/).
  * `url`: String, the URL of the webhook.
  * `content_type`: String, the content type for the payload. Valid values are
    either `form` or `json`.
  * `secret`: String, optional, the shared secret for the webhook.
    [See API documentation](https://developer.github.com/v3/repos/hooks/#create-a-hook).
    Default to `null`.
  * `insecure_ssl`: Boolean, optional, insecure SSL boolean toggle. Defaults to `false`.
  * `active`: Boolean, optional, Indicate if the webhook should receive events.
    Defaults to `true`.
  EOM
}
