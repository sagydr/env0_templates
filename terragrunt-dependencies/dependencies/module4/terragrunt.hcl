generate "null_resource" {
  path = "module4.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
resource "null_resource" "module4" {

}
EOF
}


terraform {
  source = "github.com/HeverFarber/templates.git//misc/null-resource"
}

dependency "root" {
  config_path = ".."
  skip_outputs = true

  /*  mock_outputs = {
      my_value = "module2"
    }*/
}

generate "output" {
  path = "output.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
output "my_value" {
  value = "value"
}
output "path_FROM" {
  value = "${get_path_from_repo_root()}"
}
output "path_TO" {
  value = "${get_path_to_repo_root()}"
}
output "find_IN_PARENT_folder" {
  value = "${find_in_parent_folders()}"
}
EOF
}
