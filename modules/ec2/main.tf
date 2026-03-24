resource "aws_security_group" "web_sg" {

  name = "terraform-web-sg"

  description = "Allow SSH and HTTP"

  vpc_id = var.vpc_id

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-sg"
  }
}

# EC2 Instance
resource "aws_instance" "web_server" {

  ami           = "ami-0f58b397bc5c1f2e8"

  instance_type = var.instance_type

  key_name      = var.key_name

  subnet_id     = var.subnet_id

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

  # User Data Script
 user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              systemctl start nginx
              systemctl enable nginx
              echo "Hello from Terraform Server" > /var/www/html/index.html
              EOF

  tags = {
    Name = "terraform-nginx-server"
  }

}