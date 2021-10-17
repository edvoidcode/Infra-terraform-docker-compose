provider "aws" {
  region = var.region
}

data "template_file" "docker-compose" {
  template = file("docker-compose.sh")

}

resource "aws_instance" "test" {
  ami                    = var.instace_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.lab-subnet_1.id
  vpc_security_group_ids = [aws_security_group.lab-sg.id]
  key_name               = "lab-ansible"
  user_data              = data.template_file.docker-compose.rendered

  tags = {
    Name = "test"
  }
}
