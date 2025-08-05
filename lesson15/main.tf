module "data" {
  source = "./modules/data"
  vpc_id = var.vpc_id
}

module "vm" {
  source = "./modules/vm"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  instance_name = var.instance_name
  subnet_id     = module.subnet_data.subnet_ids_by_zone[var.zone][0]
}