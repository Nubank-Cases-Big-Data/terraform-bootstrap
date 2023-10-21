resource "aws_s3_bucket" "nubank_terraform_state_bucket" {
  bucket = "${var.bucket_prefix}-${var.environment}"
}

resource "aws_s3_bucket_ownership_controls" "nubank_terraform_state_bucket_ownership_controls" {
  bucket = aws_s3_bucket.nubank_terraform_state_bucket.id

  rule {
    object_ownership = var.object_ownership
  }
}
