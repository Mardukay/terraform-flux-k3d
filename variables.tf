variable "k3d_cluster_name" {
  default = ["flux"]
  type    = list(string)
  description = "Cluster names in list"
}

variable "server_count" {
  default = 1
  type    = number
  description = "Cluster servers count"
}

variable "agent_count" {
  default = 0
  type    = number
  description = "Cluster nodes count"
}

variable "GITHUB_OWNER" {
  type        = string
  description = "The GitHub owner"
}

variable "GITHUB_TOKEN" {
  type        = string
  description = "GitHub personal access token"
}

variable "FLUX_GITHUB_REPO" {
  type        = string
  default     = "flux-gitops"
  description = "GitHub repository"
}

variable "repository_visibility" {
  type        = string
  default     = "public"
  description = "The visibility of the GitOps repository"
}

variable "target_path" {
  type        = string
  default     = "clusters"
  description = "Flux manifests subdirectory"
}

variable "kubeconfig" {
  default = ""
  type    = string
  description = "Kubeconfig path"
}

