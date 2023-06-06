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
