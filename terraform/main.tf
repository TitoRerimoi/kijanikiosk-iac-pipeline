data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "app_server" {

  source = "./modules/app_server"

  for_each = local.servers

  server_name = each.value.name

  instance_type = var.instance_type

  key_name = var.key_name

  ami_id = data.aws_ami.ubuntu.id

  security_group_id = aws_security_group.kijanikiosk.id
}
