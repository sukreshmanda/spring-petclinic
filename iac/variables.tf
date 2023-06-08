variable "AWS_REGION" {
  default = "ca-central-1"
}
variable "SUBNET_SIZE" {
  description = "size of each subnet"
  default     = 8
}
variable "availability_zones" {
  default = ["ca-central-1a", "ca-central-1b"]
}
