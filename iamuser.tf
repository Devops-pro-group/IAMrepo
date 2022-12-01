resource "aws_iam_user" "admin-user" {
name = "devopspro"
}


resource "aws_iam_policy" "policy" {
  name        = "admin-user"
  path        = "/"
  description = "My-user-policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_user_policy_attachment" "user-attach" {
  user       = aws_iam_user.admin-user.id
  policy_arn = aws_iam_policy.policy.arn
}

