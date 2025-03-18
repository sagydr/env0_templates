terraform {
  required_providers {
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
    null = {
      source = "hashicorp/null"
      version = "~> 3.2.0"
    }
  }
}

resource "null_resource" "null" {}

provider "null" {}

module "mod1" {
  source = "./modules/mod1"
}

module "modExternal1" {
  source = "./modules/external1"
}

module "modExternal2" {
  source = "./modules/external2"
}

module "mod4" {
  source = "./modules/mod4"
}
