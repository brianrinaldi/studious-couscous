module "network" {
  source                     = "./modules/network"
  name                       = "${var.name}-network"
  project                    = var.project
  region                     = var.region
  zones                      = var.zones
  webservers_subnet_name     = "webservers"
  webservers_subnet_ip_range = var.webservers_subnet_ip_range
  management_subnet_name     = "management"
  management_subnet_ip_range = var.management_subnet_ip_range
  bastion_image              = var.bastion_image
  bastion_instance_type      = var.bastion_instance_type
  user                       = var.user
  ssh_key                    = var.ssh_key
}

module "mysql-db" {
  source        = "./modules/db"
  db_name       = var.name
  project       = var.project
  region        = var.region
  user_name     = "hello"
  user_password = "hello3123!"
}

module "instance-template" {
  source        = "./modules/instance-template"
  name          = var.name
  env           = var.env
  project       = var.project
  region        = var.region
  network_name  = module.network.name
  image         = var.app_image
  instance_type = var.app_instance_type
  user          = var.user
  ssh_key       = var.ssh_key
  db_name       = var.db_name
  db_user       = var.db_user
  db_password   = var.db_pass
  db_ip         = module.mysql-db.instance_address
}

module "lb" {
  source            = "./modules/lb"
  name              = var.name
  project           = var.project
  region            = var.region
  instance_count    = var.appserver_count
  instance_template = module.instance-template.instance_template
  zones             = var.zones
}
