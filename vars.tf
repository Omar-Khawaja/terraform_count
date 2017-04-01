
variable "access_key" {}
variable "secret_key" {}
variable "region" {}

variable "ami" {
  type = "map"
  default = {
  <enter region> = "<enter AMI appropriate for region>"
  <enter region> = "<enter AMI appropriate for region>"
  <enter region> = "<enter AMI appropriate for region>"
  }
}

variable "name" {}
variable "instance_count" {
  default = 1
}
variable "instance_type" {
  default = "t2.micro"
}
variable "security_group" {
  default = "<enter default security group>"
}
variable "volume_type" {
  default = "gp2"
}
variable "volume_size" {
  default = 8
}
variable "delete_on_termination" {
  default = "true"
}
