resource "aws_instance" "ec2_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name
  tags                   = merge(var.tags, { Name = var.instance_name })

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
  }

  lifecycle {
    create_before_destroy = true
  }
}