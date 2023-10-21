variable "environment" {
  description = "Specify the deployment environment. This variable allows you to choose the environment where you want to deploy the infrastructure, which can be useful for managing multiple environments such as development, testing, and production."
  type        = string
  default     = "prd"
}

variable "secret_name" {
  description = "The name for the AWS Secrets Manager secret"
  type        = string
  default     = "TerraformServiceUserIAMCredentials"
}

variable "read_capacity" {
  description = "The read capacity for the DynamoDB table"
  type        = number
  default     = 2
}

variable "write_capacity" {
  description = "The write capacity for the DynamoDB table"
  type        = number
  default     = 2
}

variable "user_name" {
  description = "The name for the AWS IAM User"
  type        = string
  default     = "TerraformServiceUser"
}

variable "force_destroy" {
  description = "Whether to force destroy the user when removing"
  type        = bool
  default     = true
}

variable "policy_arn" {
  description = "The ARN of the policy to attach to the IAM User"
  type        = string
  default     = "arn:aws:iam::aws:policy/AdministratorAccess"
}

variable "bucket_prefix" {
  description = "The prefix for the AWS S3 bucket name"
  type        = string
  default     = "nubank-terraform-state"
}

variable "object_ownership" {
  description = "The object ownership controls for the S3 bucket"
  type        = string
  default     = "BucketOwnerPreferred"
  validation {
    condition     = contains(["BucketOwnerPreferred", "ObjectWriter"], var.object_ownership)
    error_message = "The object_ownership must be either 'BucketOwnerPreferred' or 'ObjectWriter'."
  }
}
