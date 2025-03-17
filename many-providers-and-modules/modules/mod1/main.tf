module "mod2" {
  source = "../mod2"
}



output "mod2_output" {
  value = module.mod2.result
}