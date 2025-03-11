module "tags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.tag_env
  product     = var.product
  builtFrom   = var.builtFrom
}
