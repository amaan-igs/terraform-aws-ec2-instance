output "instance_id" {
  description = "The ID of the EC2 instance."
  value       = aws_instance.ec2_instance.id
}

output "public_ip" {
  description = "The public IP address of the EC2 instance."
  value       = aws_instance.ec2_instance.public_ip
}

output "private_ip" {
  description = "The private IP address of the EC2 instance."
  value       = aws_instance.ec2_instance.private_ip
}

output "instance_arn" {
  description = "The ARN of the EC2 instance."
  value       = aws_instance.ec2_instance.arn
}

output "iam_instance_profile" {
  description = "The IAM instance profile attached to the EC2 instance."
  value       = aws_instance.ec2_instance.iam_instance_profile
}

output "instance_name" {
  value = aws_instance.ec2_instance.tags["Name"]
}

output "instance_type" {
  value = aws_instance.ec2_instance.instance_type
}

output "key_name" {
  value = aws_instance.ec2_instance.key_name
}

output "root_volume_size" {
  value = aws_instance.ec2_instance.root_block_device[0].volume_size
}

output "ebs_volumes" {
  value = aws_instance.ec2_instance.ebs_block_device
}

output "tags" {
  value = aws_instance.ec2_instance.tags
}