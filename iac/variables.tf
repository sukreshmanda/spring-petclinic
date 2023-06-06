variable "AWS_REGION" {
  default = "ap-south-1"
}
variable "AWS_AVAILABILITY_ZONES" {
  type    = set(string)
  default = ["ap-south-1a", "ap-south-1b"]
}
variable "SUBNET_SIZE" {
  description = "size of each subnet"
  default     = 8
}

variable "PUBLIC_SUBNET_MAPPING" {
  default = { "0" : "ap-south-1a", "3" : "ap-south-1b" }
}
variable "PRIVATE_SUBNET_MAPPING" {
  default = { "1" : "ap-south-1a", "4" : "ap-south-1b" }
}
variable "DB_SUBNET_MAPPING" {
  default = { "2" : "ap-south-1a", "5" : "ap-south-1b" }
}
