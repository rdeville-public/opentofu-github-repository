<!-- BEGIN DOTGIT-SYNC BLOCK MANAGED -->
# 👋 Welcome to OpenTofu Module Github Repository

<center>

> ⚠️ IMPORTANT !
>
> Main repo is on [framagit.org](https://framagit.org/rdeville-public/terraform/module-github-repository).
>
> On other online git platforms, they are just mirror of the main repo.
>
> Any issues, pull/merge requests, etc., might not be considered on those other
> platforms.

</center>

---

<center>

[![Licenses: (MIT OR BEERWARE)][license_badge]][license_url]
[![Changelog][changelog_badge]][changelog_badge_url]
[![Build][build_badge]][build_badge_url]
[![Release][release_badge]][release_badge_url]

</center>

[build_badge]: https://framagit.org/rdeville-public/terraform/module-github-repository/badges/main/pipeline.svg
[build_badge_url]: https://framagit.org/rdeville-public/terraform/module-github-repository/-/commits/main
[release_badge]: https://framagit.org/rdeville-public/terraform/module-github-repository/-/badges/release.svg
[release_badge_url]: https://framagit.org/rdeville-public/terraform/module-github-repository/-/releases/
[license_badge]: https://img.shields.io/badge/Licenses-MIT%20OR%20BEERWARE-blue
[license_url]: https://framagit.org/rdeville-public/terraform/module-github-repository/blob/main/LICENSE
[changelog_badge]: https://img.shields.io/badge/Changelog-Python%20Semantic%20Release-yellow
[changelog_badge_url]: https://github.com/python-semantic-release/python-semantic-release

OpenTofu modules allowing to manage github repository configuration.

---
<!-- BEGIN DOTGIT-SYNC BLOCK EXCLUDED CUSTOM_README -->
## 🚀 Usage

### Deploy Repo with all defaults

```hcl
module "repo" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-github-repository.git"

  # Required variables
  settings_name = "Test"
  settings_description = "Test repository description"
}
```

### Deploy Repo with all settings

```hcl
module "repo" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-github-repository.git"

  # Required variables
  settings_name         = "Test Fake Repo"
  settings_description  = "Test Fake Repository Managed With OpenTofu"

  # Example values
  settings_homepage_url = "https://fake.repo.tld"

  # Provided values are default values
  settings_visibility                  = "private"
  settings_has_issues                  = true
  settings_has_discussions             = false
  settings_has_projects                = false
  settings_has_wiki                    = false
  settings_is_template                 = false
  settings_allow_merge_commit          = true
  settings_allow_squash_merge          = false
  settings_allow_rebase_merge          = false
  settings_allow_auto_merge            = false
  settings_squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
  settings_squash_merge_commit_message = "PR_BODY"
  settings_merge_commit_title          = "PR_TITLE"
  settings_merge_commit_message        = "PR_BODY"
  settings_delete_branch_on_merge      = true
  settings_web_commit_signoff_required = true
  settings_has_downloads               = false
  settings_auto_init                   = false
  settings_gitignore_template          = ""
  settings_license_template            = ""
  settings_archived                    = false
  settings_archive_on_destroy          = false
  settings_topics                      = []
  settings_security_and_analysis = {
    advanced_security               = "disabled"
    secret_scanning                 = "disabled"
    secret_scanning_push_protection = "disabled"
  }
  settings_pages = {
    build_type = "workflow"
    cname      = null
    source = {
      branch = "main"
      path   = "dist/docs"
    }
  }
}
```

### Deploy Repo Branch Ruleset

```hcl
module "repo" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-github-repository.git"

  # Required variables
  settings_name         = "Test Fake Repo"
  settings_description  = "Test Fake Repository Managed With OpenTofu"

  # Example values
  ruleset = {
    default-branch = {
      target = "branch"
      condition = {
        ref_name = {
          include = ["~DEFAULT_BRANCH"]
          exclude = []
        },
      }
      rules = {
        creation = false
        deletion = false
        pull_request = {
          required_approving_review_count = 1
        }
      }
    }
  }
}
```

### Deploy Repo Tag Ruleset

```hcl
module "repo" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-github-repository.git"

  # Required variables
  settings_name         = "Test Fake Repo"
  settings_description  = "Test Fake Repository Managed With OpenTofu"

  # Example values
  ruleset = {
    release-tag = {
      target = "tag"
      condition = {
        ref_name = {
          include = ["~DEFAULT_BRANCH"]
        },
      }
      rules = {
        update   = false
        deletion = false
        pattern = {
          operator = "regex"
          pattern  = "v*"
          name     = "Limit version 'v*' tag creation"
        }
      }
    }
  }
}
```

### Deploy Repo both Branch and Tag ruleset

```hcl
module "repo" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-github-repository.git"

  # Required variables
  settings_name         = "Test Fake Repo"
  settings_description  = "Test Fake Repository Managed With OpenTofu"

  # Example values
  ruleset = {
    default-branch = {
      target = "branch"
      condition = {
        ref_name = {
          include = ["~DEFAULT_BRANCH"]
        },
      }
      rules = {
        creation = false
        deletion = false
        pull_request = {
          required_approving_review_count = 1
        }
      }
    }
    any-other-branch = {
      target = "branch"
      condition = {
        ref_name = {
          include = ["~ALL"]
        },
      }
      rules = {
        pull_request = {
          required_approving_review_count = 1
        }
        commit_author_email_pattern = {
          name     = "Author should be @mycompany.tld"
          operator = "ends_with"
          pattern  = "@mycompany.tld"
        }
        committer_email_pattern = {
          name     = "Commiter should be @mycompany.tld"
          operator = "ends_with"
          pattern  = "@mycompany.tld"
        }
      }
    }
    release-tag = {
      target = "tag"
      condition = {
        ref_name = {
          include = ["~DEFAULT_BRANCH"]
        },
      }
      rules = {
        update   = false
        deletion = false
        name_pattern = {
          operator = "regex"
          pattern  = "v*"
          name     = "Limit version 'v*' tag creation"
        }
        commit_author_email_pattern = {
          name     = "Author should be @mycompany.tld"
          operator = "ends_with"
          pattern  = "@mycompany.tld"
        }
        committer_email_pattern = {
          name     = "Commiter should be @mycompany.tld"
          operator = "ends_with"
          pattern  = "@mycompany.tld"
        }
      }
    }
    any-other-tag = {
      target = "tag"
      condition = {
        ref_name = {
          include = ["~DEFAULT_BRANCH"]
        },
      }
      rules = {
        creation = false
        update   = false
        deletion = false
        name_pattern = {
          operator = "regex"
          pattern  = "*"
          name     = "Forbid any tag creation"
        }
      }
    }
  }
}
```

### Deploy Repo Actions Variables

```hcl
module "repo" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-github-repository.git"

  # Required variables
  settings_name         = "Test Fake Repo"
  settings_description  = "Test Fake Repository Managed With OpenTofu"

  # Example values
  actions_variable = {
    FOO = "bar"
  }
}
```

### Deploy Repo Actions Secrets

```hcl
module "repo" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-github-repository.git"

  # Required variables
  settings_name         = "Test Fake Repo"
  settings_description  = "Test Fake Repository Managed With OpenTofu"

  # Example values
  actions_secrets = {
    BAR = "EncryptedValueUsingGithubPubKey"
  }
}
```

### Deploy Repo Issues Labels

```hcl
module "repo" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-github-repository.git"

  # Required variables
  settings_name         = "Test Fake Repo"
  settings_description  = "Test Fake Repository Managed With OpenTofu"

  # Example values
  labels = {
    "todo:triage" = {
      color = "FF0000"
      description = "Issue that need triage"
    }
    "todo:assigne" = {
      color = "DD0000"
      description = "Issue that need to be assigned"
    }
  }
}
```

### Manage team and users access to the Repo

```hcl
module "repo" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-github-repository.git"

  # Required variables
  settings_name         = "Test Fake Repo"
  settings_description  = "Test Fake Repository Managed With OpenTofu"

  # Example values
  users = {
    pull = [
      "userName"
    ]
    admin = [
      "mySuperAdmin"
    ]
  }
  teams = {
    pull = [
      "viewerTeam"
    ]
    triage = [
      "triageTeam"
    ]
    push = [
      "pushTeam"
    ]
    maintain = [
      "maintainerTeam"
    ]
    admin = [
      "admin"
    ]
  }
}
```

### Provide team or user higher access level to the Repo

If a team or user is set in two (or more) attributes (i.e. access levels), then
the higher access level is applied.

This can be usefull for instance when providing temporarly greater access
level to a team or a user while minimizing the amount of action needed.

```hcl
module "repo" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-github-repository.git"

  # Required variables
  settings_name         = "Test Fake Repo"
  settings_description  = "Test Fake Repository Managed With OpenTofu"

  # Example values
  users = {
    pull = [
      "userName"
    ]
    triate = [
      "userName"
    ]
    admin = [
      "mySuperAdmin"
    ]
  }
  teams = {
    pull = [
      "viewerTeam"
    ]
    triage = [
      "triageTeam"
    ]
    push = [
      "pushTeam"
    ]
    maintain = [
      "maintainerTeam"
    ]
    admin = [
      "maintainerTeam"
      "admin"
    ]
  }
}
```

### Manage webhook of the Repo

```hcl
module "repo" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-github-repository.git"

  # Required variables
  settings_name         = "Test Fake Repo"
  settings_description  = "Test Fake Repository Managed With OpenTofu"

  # Example values
  webhooks = {
    human-frendly-name = {
      events = [
        "issues"
      ]
      url = "https://my.app.tld/github/issues"
      content_type = "json"
    }
  }
}
```

<!-- BEGIN TF-DOCS -->
## ⚙️ Module Content

<details><summary>Click to reveal</summary>

### Table of Content

* [Requirements](#requirements)
* [Resources](#resources)
* [Inputs](#inputs)
  * [Required Inputs](#required-inputs)
  * [Optional Inputs](#optional-inputs)
* [Outputs](#outputs)

### Requirements

* [opentofu](https://opentofu.org/docs/):
  `>= 1.8, < 2.0`
* [github](https://registry.terraform.io/providers/integrations/github/):
  `~>6.2`

### Resources

* [resource.github_actions_secret.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret)
  > Manage action secrets of repository
* [resource.github_actions_variable.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_variable)
  > Manage action variables of repository
* [resource.github_issue_labels.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_labels)
  > Manage issues labels of the repository.
* [resource.github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository)
  > Manage basic settings of a Github repository.
* [resource.github_repository_collaborators.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_collaborators)
  > Manage collaborators (teams or users) access level to the repository
* [resource.github_repository_ruleset.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_ruleset)
  > Manage ruletsets of an organization.
* [resource.github_repository_webhook.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_webhook)
  > Manage repository webhook

<!-- markdownlint-capture -->
### Inputs

<!-- markdownlint-disable -->
#### Required Inputs

* [settings_name](#settings_name)
* [settings_description](#settings_description)

##### `settings_name`

String, the name of the repository.
<div style="display:inline-block;width:100%;">
<div style="float:left;border-color:#FFFFFF;width:75%;">
<details><summary>Type</summary>

```hcl
string
```

</details>
</div>
</div>

##### `settings_description`

String, a description of the repository.
<div style="display:inline-block;width:100%;">
<div style="float:left;border-color:#FFFFFF;width:75%;">
<details><summary>Type</summary>

```hcl
string
```

</details>
</div>
</div>

#### Optional Inputs

* [settings_homepage_url](#settings_homepage_url)
* [settings_visibility](#settings_visibility)
* [settings_has_issues](#settings_has_issues)
* [settings_has_discussions](#settings_has_discussions)
* [settings_has_projects](#settings_has_projects)
* [settings_has_wiki](#settings_has_wiki)
* [settings_is_template](#settings_is_template)
* [settings_allow_merge_commit](#settings_allow_merge_commit)
* [settings_allow_squash_merge](#settings_allow_squash_merge)
* [settings_allow_rebase_merge](#settings_allow_rebase_merge)
* [settings_allow_auto_merge](#settings_allow_auto_merge)
* [settings_squash_merge_commit_title](#settings_squash_merge_commit_title)
* [settings_squash_merge_commit_message](#settings_squash_merge_commit_message)
* [settings_merge_commit_title](#settings_merge_commit_title)
* [settings_merge_commit_message](#settings_merge_commit_message)
* [settings_delete_branch_on_merge](#settings_delete_branch_on_merge)
* [settings_web_commit_signoff_required](#settings_web_commit_signoff_required)
* [settings_has_downloads](#settings_has_downloads)
* [settings_auto_init](#settings_auto_init)
* [settings_gitignore_template](#settings_gitignore_template)
* [settings_license_template](#settings_license_template)
* [settings_archived](#settings_archived)
* [settings_archive_on_destroy](#settings_archive_on_destroy)
* [settings_pages](#settings_pages)
* [settings_security_and_analysis](#settings_security_and_analysis)
* [settings_topics](#settings_topics)
* [ruleset](#ruleset)
* [actions_variables](#actions_variables)
* [actions_secrets](#actions_secrets)
* [issues_labels](#issues_labels)
* [teams](#teams)
* [users](#users)
* [webhooks](#webhooks)


##### `settings_homepage_url`

String, optional, URL of a page describing the project.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `settings_visibility`

String, optional, Can be `public` or `private`.

If your organization is associated with an enterprise account using GitHub
Enterprise Cloud or GitHub Enterprise Server 2.20+, visibility can also be
`internal`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  private
  ```

  </div>
</details>

##### `settings_has_issues`

Boolean, optional, set to `false` to disable the GitHub Issues features on
the repository.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `settings_has_discussions`

Boolean, optional, set to `true` to enable the GitHub Discussion on the
repository.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_has_projects`

Boolean, optional, set to `true` to enable the GitHub Project on the
repository.

Per the GitHub documentation when in an organization that has disabled
repository projects it will default to `false`.
If you specify `true` when it has been disabled it will return an error.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_has_wiki`

Boolean, optional, set to `true` to enable the GitHub Project on the
repository.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_is_template`

Boolean, optional, set to `true`` to tell GitHub that this is a template
repository.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_allow_merge_commit`

Boolean, optional, set to `false` to disable merge commits on the repository.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `settings_allow_squash_merge`

Boolean, optional, set to `true` to enable squash merges on the repository.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_allow_rebase_merge`

Boolean, optional, set to `true` to enable rebase merges on the repository.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_allow_auto_merge`

Boolean, optional, set to `true`` to allow auto-merging pull requests on the
repository.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_squash_merge_commit_title`

String, optional, Can be `PR_TITLE`` or `COMMIT_OR_PR_TITLE`` for a default
squash merge commit title.

Applicable only if `settings_allow_squash_merge` is `true`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  COMMIT_OR_PR_TITLE
  ```

  </div>
</details>

##### `settings_squash_merge_commit_message`

String, optional, can be `PR_BODY`, `COMMIT_MESSAGES`, or `BLANK` for a
default squash merge commit message.

Applicable only if `settings_allow_squash_merge` is true.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  PR_BODY
  ```

  </div>
</details>

##### `settings_merge_commit_title`

Can be `PR_TITLE` or `MERGE_MESSAGE` for a default merge commit title.

Applicable only if `settings_allow_merge_commit` is `true`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  PR_TITLE
  ```

  </div>
</details>

##### `settings_merge_commit_message`

Can be `PR_BODY`, `PR_TITLE`, or `BLANK` for a default merge commit message.

Applicable only if `settings_allow_merge_commit` is `true`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  PR_BODY
  ```

  </div>
</details>

##### `settings_delete_branch_on_merge`

Boolean, optional, automatically delete head branch after a pull request is
merged.

Defaults to `true`

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `settings_web_commit_signoff_required`

Boolean, optional, require contributors to sign off on web-based commits.

Defaults to `true`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `settings_has_downloads`

Boolean, optional, set to `true` to enable the (deprecated) downloads features
on the repository.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_auto_init`

Boolean, optional, set to `true` to produce an initial commit in the repository.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_gitignore_template`

String, optional, use the name of the template gitignore without the extension.
For example, "Haskell".

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `settings_license_template`

String, optional, use the name of the template license without the extension.
For example, "mit" or "mpl-2.0".

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `settings_archived`

Boolean, optional, set to `true` to specifies if the repository should be
archived.

NOTE:  Currently, the API does not support unarchiving.

Defaults to `false`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_archive_on_destroy`

Boolean, optional, set to `true` to archive the repository instead of deleting
on destroy.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_pages`

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

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  object({
    source = optional(object({
      branch = string
      path   = optional(string, "/")
    }))
    build_type = optional(string, "workflow")
    cname      = optional(string)
  })
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  {}
  ```

  </div>
</details>

##### `settings_security_and_analysis`

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

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  object({
    advanced_security               = optional(string, "disabled")
    secret_scanning                 = optional(string, "disabled")
    secret_scanning_push_protection = optional(string, "disabled")
  })
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  {}
  ```

  </div>
</details>

##### `settings_topics`

List of string, optional, the list of topics of the repository.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  list(string)
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  []
  ```

  </div>
</details>

##### `ruleset`

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


<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  map(object({
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
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  {}
  ```

  </div>
</details>

##### `actions_variables`

A map of string where key is the name of the variable and value is the value
of the actions Variables

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  map(string)
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  {}
  ```

  </div>
</details>

##### `actions_secrets`

A map of string where key is the name of the secret and value is the value
of the actions Secrets

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  map(string)
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  {}
  ```

  </div>
</details>

##### `issues_labels`

A map of object, where key is the name of the labels. Object support following
attributes :

* `color`: String, A 6 character hex code, **without the leading #**,
  identifying the color of the label.
* `description`: String, A short description of the label

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  map(object({
    color       = string
    description = string
  }))
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `teams`

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


<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  object({
    pull     = optional(set(string), [])
    triage   = optional(set(string), [])
    push     = optional(set(string), [])
    maintain = optional(set(string), [])
    admin    = optional(set(string), [])
  })
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  {}
  ```

  </div>
</details>

##### `users`

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


<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  object({
    pull     = optional(set(string), [])
    triage   = optional(set(string), [])
    push     = optional(set(string), [])
    maintain = optional(set(string), [])
    admin    = optional(set(string), [])
  })
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  {}
  ```

  </div>
</details>

##### `webhooks`

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

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  map(object({
    events       = list(string)
    url          = string
    content_type = string
    secret       = optional(string)
    insecure_ssl = optional(bool, false)
    active       = optional(bool, true)
  }))
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  {}
  ```

  </div>
</details>
<!-- markdownlint-restore -->

### Outputs

* `ssh_url`:
  SSH URL to use to clone repository
* `http_url`:
  HTTPS URL to use to clone repository
* `path_with_namespace`:
  Full path of the repository of the form `owner/repo-slug`

</details>

<!-- END TF-DOCS -->
<!-- END DOTGIT-SYNC BLOCK EXCLUDED CUSTOM_README -->
## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check [issues page][issues_pages].

You can also take a look at the [CONTRIBUTING.md][contributing].

[issues_pages]: https://framagit.org/rdeville-public/terraform/module-github-repository/-/issues
[contributing]: https://framagit.org/rdeville-public/terraform/module-github-repository/blob/main/CONTRIBUTING.md

## 👤 Maintainers

* 📧 [**Romain Deville** \<code@romaindeville.fr\>](mailto:code@romaindeville.fr)
  * Website: [https://romaindeville.fr](https://romaindeville.fr)
  * Github: [@rdeville](https://github.com/rdeville)
  * Gitlab: [@r.deville](https://gitlab.com/r.deville)
  * Framagit: [@rdeville](https://framagit.org/rdeville)

## 📝 License

Copyright © 2024 [Romain Deville](code@romaindeville.fr)

This project is under following licenses (**OR**) :

* [MIT][main_license]
* [BEERWARE][beerware_license]

[main_license]: https://framagit.org/rdeville-public/terraform/module-github-repository/blob/main/LICENSE
[beerware_license]: https://framagit.org/rdeville-public/terraform/module-github-repository/blob/main/LICENSE.BEERWARE
<!-- END DOTGIT-SYNC BLOCK MANAGED -->
