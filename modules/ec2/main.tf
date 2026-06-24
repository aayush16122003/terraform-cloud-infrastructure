resource "aws_key_pair" "my_key" {

  key_name   = "terra-key"

  public_key = file("${path.root}/terra-key.pub")

}

resource "aws_security_group" "my_sg" {

  name   = "automate-sg"

  vpc_id = var.vpc_id

  ingress {

    from_port   = 80

    to_port     = 80

    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port   = 22

    to_port     = 22

    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port   = 0

    to_port     = 0

    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

}

resource "aws_instance" "web" {

  ami           = "ami-0f918f7e67a3323f0"

  instance_type = var.instance_type

  subnet_id = var.subnet_id

  vpc_security_group_ids = [

    aws_security_group.my_sg.id

  ]

  key_name = aws_key_pair.my_key.key_name

  tags = {

    Name = "Terraform-Project-EC2"

  }

}