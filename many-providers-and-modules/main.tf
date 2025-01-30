terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.0.0"
    }
    alibabacloudstack = {
      source = "aliyun/alibabacloudstack"
      version = "3.18.0"
    }
    aci = {
      source = "ciscodevnet/aci"
    }
    ably = {
      source = "ably/ably"
    }
    aembit = {
      source = "aembit/aembit"
    }
    aiven = {
      source = "aiven/aiven"
      version = ">= 4.0.0, < 5.0.0"
    }
    accuknox = {
      source = "accuknox/accuknox"
      version = ">= 1.0.0"
    }
    akamai = {
      source = "akamai/akamai"
      version = "6.6.0"
    }
    alz = {
      source = "azure/alz"
      version = ">= 0.0.1"
    }
    anxcloud = {
      source = "anexia-it/anxcloud"
      version = "~> 0.3"
    }
    alkira = {
      source = "alkiranet/alkira"
      version = ">= 1.0.0" # Specify the appropriate version
    }
    apko = {
      source = "chainguard-dev/apko"
    }
    apstra = {
      source = "Juniper/apstra"
    }
    ah = {
      source = "advancedhosting/ah"
    }
    appd = {
      source = "cisco-open/appd"
    }
    aquasec = {
      version = "0.8.33"
      source = "aquasecurity/aquasec"
    }
    auth0 = {
      source = "auth0/auth0"
    }
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.0.0"
    }
    b1ddi = {
      source = "infobloxopen/b1ddi"
    }
    datadog = {
      source = "DataDog/datadog"
    }
    google = {
      source = "hashicorp/google"
      version = ">= 4.0.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 1.0.0"
    }
    alicloud = {
      source = "aliyun/alicloud"
    }
    boundary = {
      source = "hashicorp/boundary"
    }
    consul = {
      source = "hashicorp/consul"
    }
    env0 = {
      source = "env0/env0"
    }
    openstack = {
      source = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
    nomad = {
      source = "hashicorp/nomad"
    }
    vsphere = {
      source = "hashicorp/vsphere"
    }
  }
}

resource "null_resource" "null" {}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "my-s3-bucket"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = "example"
  cluster_version = "1.31"

  # Optional
  cluster_endpoint_public_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  cluster_compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }

  vpc_id     = "vpc-1234556abcdef"
  subnet_ids = ["subnet-abcde012", "subnet-bcde012a", "subnet-fghi345a"]

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}

module "iam_account" {
  source = "terraform-aws-modules/iam/aws//modules/iam-account"

  account_alias = "awesome-company"

  minimum_password_length = 37
  require_numbers         = false
}

module "eg_prod_bastion_label" {
  source = "cloudposse/label/null"

  namespace  = "eg"
  stage      = "prod"
  name       = "bastion"
  attributes = ["public"]
  delimiter  = "-"

  tags = {
    "BusinessUnit" = "XYZ",
    "Snapshot"     = "true"
  }
}
