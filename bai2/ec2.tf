resource "aws_iam_instance_profile" "s3_rds_profile" {
  name = "S3_RDS_Profile1"
  role = aws_iam_role.s3_rds_role.name
}


resource "aws_instance" "web" {
  //ami           = "ami-0ff89c4ce7de192ea"
  ami             = "ami-067e6178c7a211324"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.generated_key.key_name}"
  iam_instance_profile = aws_iam_instance_profile.s3_rds_profile.name
  security_groups = ["ingress_rules"]
  user_data = file("script.sh")
  

  tags = {
    Name = "HelloWorld"
  }
  
    provisioner "file" {
    source      = "./uploads3"
    destination = "/home/ec2-user/uploads3"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./${var.keyname}.pem")
      host        = aws_instance.web.public_ip
    }
  }
}
locals {
  instance_ip = aws_instance.web.public_ip
}
output "ssh_command" {
  value = "ssh -i '${var.keyname}.pem' ec2-user@${local.instance_ip}"
}