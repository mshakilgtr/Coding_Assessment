
// Sends your public key to the instance
resource "aws_key_pair" "MS_KEY_Pair"{
    key_name = "MS_KEY_Pair"
    public_key = "${file(var.public_key_path)}"
}

resource "aws_instance" "MS_EC2_Instance" {
    ami = "${var.instance_ami}"
    instance_type = "${var.instance_type}"
	//VPC
    subnet_id = "${aws_subnet.MS_VPC_Subnet.id}"
	//Security Group
    vpc_security_group_ids = ["${aws_security_group.MS-SG.id}"]
	//the Public SSH key
    key_name = "${aws_key_pair.MS_KEY_Pair.id}"

}
