variable "region" {
  type    = string
  default = "eu-west-1"
}

# variable to instance cidr-block for vpc
variable "cidr-block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "cidr block of lab-vpc"
}
# variable to instance cidr-block for subnet
variable "subnet1-cidr" {
  type        = string
  default     = "10.0.0.0/24"
  description = "cidr block of subnet1"
}
variable "instace_id" {
  type        = string
  default     = "ami-0a8e758f5e873d1c1"
  description = "ubuntu-ami-id"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "infos about my instance"
}
