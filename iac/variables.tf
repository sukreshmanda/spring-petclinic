variable "AWS_REGION" {
  default = "ca-central-1"
}
variable "SUBNET_SIZE" {
  description = "size of each subnet"
  default     = 8
}

variable "PUBLIC_SUBNET_MAPPING" {
  default = { "0" : "ca-central-1a", "3" : "ca-central-1b" }
}
variable "PRIVATE_SUBNET_MAPPING" {
  default = { "1" : "ca-central-1a", "4" : "ca-central-1b" }
}
variable "DB_SUBNET_MAPPING" {
  default = { "2" : "ca-central-1a", "5" : "ca-central-1b" }
}
