variable "k3d_cluster_name" {
  default = "flux"
  type = string
}

variable "server_count" {
  default = 1
  type    = number
}

variable "agent_count" {
  default = 0
  type    = number
}

variable "github_owner" {
  type        = string
  description = "The GitHub owner"
}

variable "github_token" {
  type        = string
  description = "GitHub personal access token"
}

variable "repository_name" {
  type        = string
  default     = "flux-gitops"
  description = "GitHub repository"
}

variable "repository_visibility" {
  type        = string
  default     = "public"
  description = "The visibility of the GitOps repository"
}



