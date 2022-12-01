#main.tf
provider "aws" {
  region     = "us-west-2"
  profile = "brice"
}

resource "aws_iam_user" "dev_users"{
  count = "${length(var.username)}"
  name = "${element(var.username,count.index )}"
  path = "/system/"
  
}


resource "aws_iam_access_key" "my_users"{
  count = length(var.username)
  user = element(var.username,count.index)
}

/*  if you want to create more than one IAM Users, you can combine count.index with
 interpolation functions built into Terraform, you can customize each “iteration” of the “loop” even more
  To achieve this we need two interpolation functions length and element(list, index) */

/* The length function returns the number of items in the list(it also works with strings and maps)
 replace the previous resource block of aws_iam_user with the below one to use the variables by 
 creating a file called variables.tf & copy-paste the variables block. */