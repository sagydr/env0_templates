module "externalGit" {
  source = "git@github.com:hashicorp/example.git"
}

module "externalBB" {
  source = "bitbucket.org/hashicorp/terraform-consul-aws"
}