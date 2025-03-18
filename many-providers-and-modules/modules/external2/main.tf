module "externalGit" {
  source = "github.com/env0/terraform-provider-env0"
}

module "externalBB" {
  source = "bitbucket.org/env0/approval-policies"
}