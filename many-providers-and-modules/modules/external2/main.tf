module "externalGit" {
  source = "git::https://github.com/cloudposse/terraform-null-label.git?ref=master"

  namespace  = "example"
  stage      = "dev"
  name       = "app"
}