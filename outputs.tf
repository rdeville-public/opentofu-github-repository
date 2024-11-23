output "ssh_url" {
  value       = github_repository.this.ssh_clone_url
  description = "SSH URL to use to clone repository"
}

output "http_url" {
  value       = github_repository.this.http_clone_url
  description = "HTTPS URL to use to clone repository"
}

output "name" {
  value       = github_repository.this.full_name
  description = "Full path of the repository of the form `owner/repo-slug`"
}

output "full_name" {
  value       = github_repository.this.full_name
  description = "Full path of the repository of the form `owner/repo-slug`"
}
