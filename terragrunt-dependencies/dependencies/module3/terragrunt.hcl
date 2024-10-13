generate "null_resource" {
  path = "module3.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
resource "null_resource" "module3" {

}
EOF
}

inputs = {
  my_value = "module3_value"
}

generate "output" {
  path = "output.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
output "my_value" {
  value = var.my_value
}
output "find_IN_PARENT_folder" {
  value = "${find_in_parent_folders()}"
}
output "get_TG_dir" {
  value = "${get_terragrunt_dir()}"
}
output "get_ORIG_WORKDIR" {
  value = "${get_original_terragrunt_dir()}"
}
output "path_FROM" {
  value = "${get_path_from_repo_root()}"
}
output "path_TO" {
  value = "${get_path_to_repo_root()}"
}

EOF
}

dependency "module4" {
  config_path = "../module4"

  mock_outputs = {
    my_value = "module2"
  }
}

generate "variables" {
  path = "variables.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
variable "my_value" {}
EOF
}
