variable "env" {
  default = "homework"
}
variable "name" {
  default = "homework"
}
variable "region" {
  default = "us-central1"
}
variable "zones" {
  default = ["us-central1-a"]
}
variable "webservers_subnet_ip_range" {
  default = "192.168.1.0/24"
}
variable "management_subnet_ip_range" {
  default = "192.168.100.0/24"
}
variable "bastion_image" {
  default = "centos-7-v20170918"
}
variable "bastion_instance_type" {
  default = "f1-micro"
}
variable "appserver_count" {
  default = 2
}
variable "app_image" {
  default = "centos-7-v20170918"
}
variable "app_instance_type" {
  default = "f1-micro"
}

// REQUIRED
// Your local ssh user, used to add ssh keys to gcp instances.
variable "user" {
  default = "brinaldi"
}
variable "ssh_key" {
  default = "~/.ssh/id_rsa.pub"
}
// GCP project id
variable "project" {
  default = ""
}
// GCP billing account. Usually email associated with GCP account.
variable "billing_account" {
  default = ""
}
// MySQL connection deets
variable "db_user" {
  default = "homework"
}
variable "db_name" {
  default = "homework"
}
variable "db_pass" {
  default = ""
}
