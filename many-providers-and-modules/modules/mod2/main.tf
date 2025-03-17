module "mod3" {
  source = "../mod3"
}

output "mod3_output" {
  value = module.mod3.result
}