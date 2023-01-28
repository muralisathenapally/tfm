variable "project_id" {
  type        = string
  description = "Id the of Project"
}
variable "vpc_name" {
  type        = string
  description = "The name of VPC"
}
variable "subnets" {
  type        = list(map(string))
  description = "The list of subnets being created. subnet_name, subnet_ip, subnet_region are madatory"
}
variable "shared_vpc_host" {
  type        = bool
  description = "Makes this project a Shared VPC host if 'true' (default 'false')"
  default     = false
}
variable "auto_create_subnetworks" {
  type        = bool
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
  default     = false
}