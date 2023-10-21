resource "aws_iam_user" "terraform_service_user" {
  name          = var.user_name
  force_destroy = var.force_destroy
}

resource "aws_iam_access_key" "terraform_service_user_key" {
  user = aws_iam_user.terraform_service_user.name
}

resource "aws_iam_user_policy_attachment" "terraform_service_user_admin_policy" {
  user       = aws_iam_user.terraform_service_user.name
  policy_arn = var.policy_arn
}
