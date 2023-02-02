terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~>5.8.0"
    }
  }
}


provider "github" {
  token = var.github_token
  owner = var.target_repository.owner
}


resource "github_repository" "repository" {
  name                   = var.target_repository.repo
  description            = "Required Workflows JavaScript Repository for @${var.actor}"
  visibility             = "internal"
  has_issues             = true
  has_projects           = false
  delete_branch_on_merge = true
  vulnerability_alerts   = true
  template {
    owner      = var.template_repository.owner
    repository = var.template_repository.repo
  }

  topics = [
    "required-workflows",
    "javascript",
    "nodejs"
  ]
}

resource "github_team" "repository_admins" {
  name                      = "${github_repository.repository.name}-admins"
  description               = "Admins for the ${github_repository.repository.name} repository"
  create_default_maintainer = true
}

resource "github_team_repository" "repository_admins" {
  team_id = github_team.repository_admins.id
  repository = github_repository.repository.name
  permission = "admin"
}

resource "github_team_membership" "actor_repository_admin" {
  team_id = github_team.repository_admins.id
  username = var.actor
  role = "maintainer"
}

output "repository_url" {
  value       = github_repository.repository.html_url
  description = "The HTML URL for the newly created repository"
}

output "repository_full_name" {
  value       = github_repository.repository.full_name
  description = "The name for the newly created repository in 'owner/repo_name' form"
}
