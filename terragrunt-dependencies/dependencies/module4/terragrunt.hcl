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
output "my_value4" {
  value = "value4"
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

EOF
}
