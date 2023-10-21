resource "aws_secretsmanager_secret" "tf_user_credentials" {
  name = var.secret_name
}

resource "aws_secretsmanager_secret_version" "tf_user_credentials_version" {
  secret_id = aws_secretsmanager_secret.tf_user_credentials.id
  secret_string = jsonencode({
    access_key = aws_iam_access_key.terraform_service_user_key.id,
    secret_key = aws_iam_access_key.terraform_service_user_key.secret
  })
}
