module "iam" {
  source     = "./iam_binding"
  project_id = var.project_id
  bindings   = var.iam_bindings
}