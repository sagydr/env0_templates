resource "null_resource" "null" {
}

variable "xxxemail" {
  xxxtype = string
  description = "env variable exported in env0.yml"
  default = "default@domain.com"
}

ouxxxtput "custom_flow_tf_var" {
  value = var.email
}
