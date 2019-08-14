variable "ami" {
  default = "ami-0ad82a384c06c911e"
}

variable "sgs" {
  type = "list"
  default = ["sg-0a5e240626250fd7a", "sg-0c38d3e45e9a76b16"]
}
