##############################################
# Bastion Security Group
##############################################

resource "aws_security_group" "bastion" {

  name        = "${var.project_name}-${var.environment}-bastion-sg"
  description = "Security Group for Bastion Host"

  vpc_id = var.vpc_id

  ingress {

    description = "SSH"

    from_port = 22
    to_port   = 22

    protocol = "tcp"

    cidr_blocks = [
      var.my_ip
    ]
  }

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-bastion-sg"
  }
}

##############################################
# Bastion EC2
##############################################

resource "aws_instance" "bastion" {

  ami = data.aws_ami.ubuntu.id

  instance_type = "t3.micro"

  subnet_id = var.public_subnet_id

  key_name = var.key_name

  vpc_security_group_ids = [
    aws_security_group.bastion.id
  ]

  associate_public_ip_address = true

  tags = {
    Name = "${var.project_name}-${var.environment}-bastion"
  }
}