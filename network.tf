resource "aws_internet_gateway" "MS-IGW" {
    vpc_id = "${aws_vpc.MS_VPC.id}"
    tags = {
        Name = "MS-IGW"
    }
}

resource "aws_route_table" "MS-Public-CRT" {
    vpc_id = "${aws_vpc.MS_VPC.id}"

    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0"
		//CRT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.MS-IGW.id}"
    }

    tags = {
        Name = "MS-Public-CRT"
    }
}

resource "aws_route_table_association" "MS-CRTA-Public-Subnet-1"{
    subnet_id = "${aws_subnet.MS_VPC_Subnet.id}"
    route_table_id = "${aws_route_table.MS-Public-CRT.id}"
}

resource "aws_security_group" "MS-SG" {
    vpc_id = "${aws_vpc.MS_VPC.id}"

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
	ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
	//Opening http/https ports

	ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

	ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        
    }

	tags = {
        Name = "MS-SG"
        }
}
