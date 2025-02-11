# Required
variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start."
  type        = string
  default     = "t2.micro" # Optional
}

# Required
variable "subnet_id" {
  description = "The VPC Subnet ID to launch the instance in."
  type        = string
}

# Required
variable "security_group_ids" {
  description = "A list of security group IDs to associate with the instance."
  type        = list(string)
}

variable "key_name" {
  description = "The key name of the Key Pair to use for the instance."
  type        = string
  default     = "" # Optional
}

# Required
variable "instance_name" {
  description = "The name tag for the EC2 instance."
  type        = string
}

variable "root_volume_size" {
  description = "The size of the root volume in gigabytes."
  type        = number
  default     = 8 # Optional
}

variable "root_volume_type" {
  description = "The type of the root volume (e.g., gp2, gp3)."
  type        = string
  default     = "gp2" # Optional
}

variable "root_volume_encryption" {
  description = "Enable encryption for the root volume."
  type        = bool
  default     = true # Optional
}

variable "tags" {
  description = "A map of tags to assign to the instance."
  type        = map(string)
  default     = {} # Optional
}

variable "iam_instance_profile" {
  description = "The IAM instance profile to attach to the EC2 instance."
  type        = string
}

variable "ebs_volumes" {
  description = "A list of additional EBS volumes to attach to the instance."
  type = list(object({
    device_name = string
    volume_size = number
    volume_type = string
    encrypted   = bool
  }))
  default = [] # Optional
}

variable "enable_imdsv2" {
  description = "Enable IMDSv2 for the EC2 instance."
  type        = bool
  default     = true # Optional
}