terraform {
  required_version = ">= 1.0"
}

module "external_module" {
  source = "terraform-aws-modules/s3-bucket/aws"   # Example: An external module from Terraform Registry
  version = "3.15.0"

  bucket = "my-test-bucket"
  acl    = "private"
}