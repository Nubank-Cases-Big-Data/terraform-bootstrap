resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity

  name     = "terraform-state-lock-dynamo-${var.environment}"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
