variable "region" {
  default = "us-east-2"
}
variable "AmiLinux" {
  type = map(any)
  default = {
    us-east-2 = "ami-0d5bf08bc8017c83b"       #      "ami-0ee23bfc74a881de5" # Virginia
  }
  description = "have only added one region"
}
  