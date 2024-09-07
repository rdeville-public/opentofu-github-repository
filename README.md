<!-- BEGIN DOTGIT-SYNC BLOCK MANAGED -->
# 👋 Welcome to OpenTofu Module Github Repository

<center>

> ⚠️ IMPORTANT !
>
> Main repo is on [framagit.org](https://framagit.org/rdeville-public/terraform/module-github-groups).
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

[build_badge]: https://framagit.org/rdeville-public/terraform/module-github-groups/badges/main/pipeline.svg
[build_badge_url]: https://framagit.org/rdeville-public/terraform/module-github-groups/-/commits/main
[release_badge]: https://framagit.org/rdeville-public/terraform/module-github-groups/-/badges/release.svg
[release_badge_url]: https://framagit.org/rdeville-public/terraform/module-github-groups/-/releases/
[license_badge]: https://img.shields.io/badge/Licenses-MIT%20OR%20BEERWARE-blue
[license_url]: https://framagit.org/rdeville-public/terraform/module-github-groups/blob/main/LICENSE
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

* [resource.github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository)
  > Manage basic settings of a Github repository.

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

[issues_pages]: https://framagit.org/rdeville-public/terraform/module-github-groups/-/issues
[contributing]: https://framagit.org/rdeville-public/terraform/module-github-groups/blob/main/CONTRIBUTING.md

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

[main_license]: https://framagit.org/rdeville-public/terraform/module-github-groups/blob/main/LICENSE
[beerware_license]: https://framagit.org/rdeville-public/terraform/module-github-groups/blob/main/LICENSE.BEERWARE
<!-- END DOTGIT-SYNC BLOCK MANAGED -->

<!-- BEGIN TF-DOCS -->
## ⚙️ Module Content

<details><summary>Click to reveal</summary>

### Table of Content




</details>

<!-- END TF-DOCS -->
