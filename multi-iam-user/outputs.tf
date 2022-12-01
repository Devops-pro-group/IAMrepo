/* To provide the Amazon Resource Name (ARN) of one of the IAM users as an output variable 
*/

# outputs.tf

output "user_arn" {
 value = "${aws_iam_user.dev_users.0.arn}"
}

/* Also if you want the ARNs of all the IAM users then create outputs.tf & 
add the output block you need to use the splat character, “*”, instead of the index
 */