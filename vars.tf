variable "AWS_REGION" {
    default = "us-east-1"
}

variable "aws_vpc_name" {
  description = "VPC Name"
  default = "MS_VPC"
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  default = "10.0.0.0/16"
}

variable "aws_vpc_subnet" {
  description = "Subnet of the VPC"
  default = "MS_VPC_Subnet"
}

variable "cidr_subnet" {
  description = "CIDR block for the subnet"
  default = "10.0.1.0/24"
}
variable "availability_zone" {
  description = "availability zone to create subnet"
  default = "us-east-1a"
}
variable "public_key_path" {
  description = "Public key path"
  default = "~/.ssh/linux_key.pub"
}
variable "instance_ami" {
  description = "AMI for aws EC2 instance"
  default = "ami-03ededff12e34e59e"
}
variable "instance_type" {
  description = "type for aws EC2 instance"
  default = "t2.micro"
}
