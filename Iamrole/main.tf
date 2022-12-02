resource "aws_iam_role" "ec2_s3_access_role" {
  name               = "s3-role"
  assume_role_policy = file("assumerolepolicy.json")
}

# 4. Creating the IAM instance profile using terraform:
resource "aws_iam_instance_profile" "test_profile" {
  name  = "test_profile"
  role = "${aws_iam_role.ec2_s3_access_role.name}"

}

#2. Creating an AWS IAM policy using Terraform

resource "aws_iam_policy" "policy" {
  name        = "test-policy"
  description = "A test policy"
  policy      = file("policys3bucket.json")
}

# 3. Attaching the policy to the role using Terraform

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  roles      = ["${aws_iam_role.ec2_s3_access_role.name}"]
  policy_arn = aws_iam_policy.policy.arn
}




