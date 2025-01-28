terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    },
    alibabacloudstack = {
      source = "aliyun/alibabacloudstack"
      version = "3.18.0"
    },
    aci = {
      source = "ciscodevnet/aci"
    },
    airbyte = {
      source  = "airbytehq/airbyte"
      version = "0.13.0"
    },
    ably = {
      source = "ably/ably"
    },
    aembit = {
      source = "aembit/aembit"
    },
    aiven = {
      source = "aiven/aiven"
      version = ">= 4.0.0, < 5.0.0"
    },
    accuknox = {
      source = "hashicorp/accuknox"
      version = "1.0.0"
    },
    akamai = {
      source = "akamai/akamai"
      version = "6.6.0"
    },
    alz = {
      source  = "azure/alz"
      version = "<version>" # change this to your desired version, https://www.terraform.io/language/expressions/version-constraints
    },
    anxcloud = {
      source  = "anexia-it/anxcloud"
      version = "~> 0.3"
    }
  }
}

provider "apko" {}

provider "apstra" {
  url                     = "https://apstra.example.com" # required
  tls_validation_disabled = true                         # optional
  blueprint_mutex_enabled = false                        # optional
  api_timeout             = 0                            # optional; 0 == infinite
}

provider "ah" {
  access_token = "auth_token_here"
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

provider "aws" {
  region  = "us-east-1"
}

provider "google" {
  project     = "my-project-id"
  region      = "us-central1"
}

provider "alicloud" {
  access_key = "var.access_key"
  secret_key = "var.secret_key"
}

provider "boundary" {
  addr                   = "http://127.0.0.1:9200"
  auth_method_id         = "ampw_1234567890" # changeme
  auth_method_login_name = "myuser"          # changeme
  auth_method_password   = "passpass"        # changeme
}

provider "consul" {
  address    = "demo.consul.io:80"
  datacenter = "nyc1"
}

provider "opc" {
  user            = "..."
  password        = "..."
  identity_domain = "..."
  endpoint        = "..."
}

provider "nomad" {
  address = "http://nomad.mycompany.com:4646"
  region  = "us-east-2"
}

provider "vsphere" {
  user                 = "var.vsphere_user"
  password             = "var.vsphere_password"
  vsphere_server       = "var.vsphere_server"
  allow_unverified_ssl  = true
  api_timeout          = 10
}

provider "aci" {
  username = "admin"
  password = "password"
  url      = "https://my-cisco-aci.com"
}

provider "alkira" {
  portal    = "tenant.portal.alkira.com"
  provision = true
}