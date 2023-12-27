#create github repository for flux
module "git_repo" {
  source                   = "github.com/den-vasyliev/tf-github-repository"
  github_owner             = var.GITHUB_OWNER
  github_token             = var.GITHUB_TOKEN
  repository_name          = var.FLUX_GITHUB_REPO
  public_key_openssh       = module.tls_private_key.public_key_openssh
  repository_visibility    = var.repository_visibility
  public_key_openssh_title = "flux"
}

#create ssh key for repository
module "tls_private_key" {
  source = "github.com/den-vasyliev/tf-hashicorp-tls-keys"
}

#create kubernetes cluster for flux in local k3d
module "k3d_cluster" {
  source           = "github.com/Mardukay/tf-kubernetes-cluster"
  k3d_cluster_name = var.k3d_cluster_name
  server_count     = var.server_count
  agent_count      = var.agent_count
}

#deploy flux to cluster and connect to github repository
provider "flux" {
  kubernetes = {
    config_path = var.kubeconfig
  }
  git = {
    url = "https://github.com/${var.GITHUB_OWNER}/${var.FLUX_GITHUB_REPO}.git"
    http = {
      username = "git"
      password = var.GITHUB_TOKEN
    }
  }
}

resource "flux_bootstrap_git" "this" {
  path       = var.target_path
  depends_on = [module.git_repo, module.k3d_cluster, module.tls_private_key]
}