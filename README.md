[![Terraform pipeline](https://github.com/amaan-igs/terraform-aws-ec2-instance/actions/workflows/main.yml/badge.svg)](https://github.com/amaan-igs/terraform-aws-ec2-instance/actions/workflows/main.yml)

# Terraform EC2 Instance Module

<img src="https://github.com/user-attachments/assets/a09f3eff-3e08-4a3c-b490-71117a40080b" width="460" height="100"/><br>

This module creates an EC2 instance in AWS with configurable options for AMI, instance type, security groups, and more. It follows SUDO's Terraform standards and best practices for reusable, secure, and maintainable infrastructure as code.

## Usage

```hcl
module "ec2_instance" {
  source = "git::https://github.com/----"

  ami_id             = "ami-0c55b159cbfafe1f0"
  instance_type      = "t2.micro"
  subnet_id          = "subnet-0123456789abcdef0"
  security_group_ids = ["sg-0123456789abcdef0"]
  instance_name      = "example-instance"
  tags = {
    Environment = "dev"
  }
}
```

## Inputs

| Name                | Description                                     | Type          | Default   | Required |
|---------------------|---------------------------------|--------------|----------|----------|
| `ami_id`           | The AMI ID to use for the EC2 instance.        | `string`      | -        | Yes      |
| `instance_type`    | The type of instance to start.                 | `string`      | `t2.micro` | No      |
| `subnet_id`        | The VPC Subnet ID to launch the instance in.   | `string`      | -        | Yes      |
| `security_group_ids` | A list of security group IDs to associate.  | `list(string)` | -        | Yes      |
| `key_name`         | The key name of the Key Pair to use.           | `string`      | `""`     | No       |
| `instance_name`    | The name tag for the EC2 instance.             | `string`      | -        | Yes      |
| `root_volume_size` | The size of the root volume in gigabytes.      | `number`      | `8`      | No       |
| `root_volume_type` | The type of the root volume (e.g., gp2, gp3).  | `string`      | `gp2`    | No       |
| `tags`            | A map of tags to assign to the instance.        | `map(string)` | `{}`     | No       |

---

## Outputs

| Name         | Description                                  |
|-------------|--------------------------------|
| `instance_id` | The ID of the EC2 instance.  |
| `public_ip`   | The public IP address of the instance.  |
| `private_ip`  | The private IP address of the instance.  |
| `instance_arn` | The ARN of the EC2 instance. |

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