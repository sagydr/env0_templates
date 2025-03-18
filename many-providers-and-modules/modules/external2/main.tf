module "externalGit" {
  source = "github.com/hashicorp/example"
}

module "externalBB" {
  source = "bitbucket.org/hashicorp/terraform-consul-aws"
}