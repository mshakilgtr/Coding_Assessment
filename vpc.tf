resource "aws_vpc" "MS_VPC"{
    cidr_block = "${var.cidr_block}"
    tags = {
            Name = "MS_VPC"
            }

}

resource "aws_subnet" "MS_VPC_Subnet" {
    vpc_id = "var.aws_vpc.id"
    cidr_block = "${var.cidr_subnet}"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "${var.AWS_REGION}"
    tags = {
            Name = "MS_VPC_Subnet"
          }
}
