variable "ami_id" {
  description = "Provide AMI ID"
}

variable "instance_type" {
  description = "Type of Instance"
}
variable "tag_name" {
  description = "Name of the Tag"
}
variable "public_key" {
  description = "Name of Public key"
}
variable "subnet_id" {
  description = "provide subnet id"
}
variable "sg_for_jenkins" {
  description = "Name of the sg for jenkins"
}
variable "enable_public_ip_address" {
  description = "Enable the public keyfor ip address"
}
variable "user_data_install_jenkins" {
  description = "Give the user data of jenkins"
}