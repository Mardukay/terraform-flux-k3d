module "git_repo" {
    source = "github.com/den-vasyliev/tf-github-repository"
    owner = var.github_owner
    token = var.github_token
    repository = var.repository_name
    visibility = var.repository_visibility
    public_key_openssh = module.tls_private_key.public_key_openssh
    public_key_openssh_title = flux
}

module "tls_private_key" {
  source = "github.com/den-vasyliev/tf-hashicorp-tls-keys"
}

module "k3d_cluster" {
    source = "github.com/Mardukay/terraform-flux-k3d"
    name = var.cluster_name
    server = var.server_count
    agent = var.agent_count 
}

