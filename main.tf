resource "aws_instance" "ec2_instance" {
  ami                    = var.ami_id                                                       # Required
  instance_type          = var.instance_type                                                # Optional (default: t2.micro)
  subnet_id              = var.subnet_id                                                    # Required
  vpc_security_group_ids = var.security_group_ids                                           # Required
  key_name               = var.key_name                                                     # Optional
  iam_instance_profile   = var.iam_instance_profile != "" ? var.iam_instance_profile : null # Optional
  tags                   = merge(var.tags, { Name = var.instance_name })                    # Required (instance_name), Optional (tags)
  monitoring             = true                                                             #CKV_AWS_126
  ebs_optimized          = true                                                             #CKV_AWS_135

  # Root volume configuration
  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = var.root_volume_encryption
  }

  dynamic "ebs_block_device" {
    for_each = var.ebs_volumes
    content {
      device_name = ebs_block_device.value.device_name
      volume_size = ebs_block_device.value.volume_size
      volume_type = ebs_block_device.value.volume_type
      encrypted   = ebs_block_device.value.encrypted
    }
  }

  # IMDSv2 configuration
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = var.enable_imdsv2 ? "required" : "optional" # Optional (default: required)
  }

  lifecycle {
    create_before_destroy = true
  }
}
