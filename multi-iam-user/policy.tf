# Policy.tf
# for strict password creation strength when users log in for the first time.

resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = false
  allow_users_to_change_password = true
}
resource "aws_iam_user_policy" "dev_policy" {
  count = length(var.username)
  name = "dev"
  user = element(var.username,count.index)
policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

/* 
IAM Policy consists of one or more statements
Each of which specifies an effect (either “Allow” or “Deny”)
One or more actions (e.g., “ec2:Describe*” allows all API calls to EC2 that start with the name “Describe”),
One or more resources (e.g., “*” means “all resources”) */
