# Terraform EC2 Instance Module

This module creates an EC2 instance in AWS with configurable options for AMI, instance type, security groups, and more. It follows SUDO's Terraform standards and best practices for reusable, secure, and maintainable infrastructure as code.

## Usage

```hcl
module "ec2_instance" {
  source = "git::https://github.com/amaan-igs/terraform-aws-ec2-instance.git"

  ami_id                = "ami-00bb6a80f01f03502"
  instance_type         = "t2.micro"
  subnet_id             = "subnet-0194c32a03d44fdbd"
  security_group_ids    = ["sg-07ea31bd8b8dab9f1"]
  instance_name         = "prod-sample"
  key_name              = "sample-key" # Ensure the key exists in AWS
  iam_instance_profile  = "sample-instance-profile"
  root_volume_size      = 10
  root_volume_type      = "gp3"
  root_volume_encryption = true
  enable_imdsv2         = true

  ebs_volumes = [
    {
      device_name = "/dev/xvdf"
      volume_size = 30
      volume_type = "gp3"
      encrypted   = true
    }
  ]

  tags = {
    Environment = "production"
    Project     = "sample-project"
  }
}
```

## Inputs

| Name                  | Description                                                  | Type            | Default   | Required |
|-----------------------|--------------------------------------------------------------|----------------|----------|----------|
| `ami_id`             | The AMI ID to use for the EC2 instance.                      | `string`        | -        | Yes      |
| `instance_type`      | The type of instance to start.                               | `string`        | `t2.micro` | No      |
| `subnet_id`          | The VPC Subnet ID to launch the instance in.                 | `string`        | -        | Yes      |
| `security_group_ids` | A list of security group IDs to associate with the instance. | `list(string)`  | -        | Yes      |
| `key_name`           | The key name of the Key Pair to use for the instance.        | `string`        | `""`     | No       |
| `instance_name`      | The name tag for the EC2 instance.                           | `string`        | -        | Yes      |
| `root_volume_size`   | The size of the root volume in gigabytes.                    | `number`        | `8`      | No       |
| `root_volume_type`   | The type of the root volume (e.g., gp2, gp3).                | `string`        | `gp2`    | No       |
| `root_volume_encryption` | Enable encryption for the root volume.                   | `bool`          | `true`   | No       |
| `tags`              | A map of tags to assign to the instance.                      | `map(string)`   | `{}`     | No       |
| `iam_instance_profile` | The IAM instance profile to attach to the EC2 instance.    | `string`        | `""`     | No       |
| `ebs_volumes`       | A list of additional EBS volumes to attach to the instance.  | `list(object)`  | `[]`     | No       |
| `enable_imdsv2`     | Enable IMDSv2 for the EC2 instance.                           | `bool`          | `true`   | No       |
---

## Outputs

| Name                   | Description                                          | Value                                       |
|------------------------|------------------------------------------------------|---------------------------------------------|
| `instance_id`         | The ID of the EC2 instance.                          | `aws_instance.ec2_instance.id`             |
| `public_ip`          | The public IP address of the EC2 instance.           | `aws_instance.ec2_instance.public_ip`      |
| `private_ip`         | The private IP address of the EC2 instance.          | `aws_instance.ec2_instance.private_ip`     |
| `instance_arn`       | The ARN of the EC2 instance.                         | `aws_instance.ec2_instance.arn`            |
| `iam_instance_profile` | The IAM instance profile attached to the instance. | `aws_instance.ec2_instance.iam_instance_profile` |
| `instance_name`      | The name tag assigned to the EC2 instance.           | `aws_instance.ec2_instance.tags["Name"]`   |
| `instance_type`      | The type of the EC2 instance.                        | `aws_instance.ec2_instance.instance_type`  |
| `key_name`          | The key pair name assigned to the EC2 instance.      | `aws_instance.ec2_instance.key_name`       |
| `root_volume_size`  | The size of the root volume in GB.                    | `aws_instance.ec2_instance.root_block_device[0].volume_size` |
| `ebs_volumes`       | The additional EBS volumes attached to the instance.  | `aws_instance.ec2_instance.ebs_block_device` |
| `tags`              | The tags associated with the EC2 instance.            | `aws_instance.ec2_instance.tags`           |
---

## File Structure Overview 

```plaintext
sudo-terraform-ec2-instance/
├── .github/
│   └── workflows/
│       └── main.yml           # CI/CD workflow for linting and testing Terraform configurations
├── .gitignore                 # Git ignore file for Terraform, IDEs, and other unwanted files
├── .pre-commit-config.yaml    # Pre-commit hooks configuration (e.g., Terraform lint, format)
├── LICENSE                    # License file for the project
├── main.tf                    # Entry point for the Terraform configuration
├── outputs.tf                 # Definitions of module outputs
├── README.md                  # Project documentation (this file)
├── variables.tf               # Definitions of module input variables
└── versions.tf                # Terraform and provider version constraints
```
