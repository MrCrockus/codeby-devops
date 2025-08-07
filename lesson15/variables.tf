variable "vpc_id" {
  description = "id vpc"
  type        = string
}

variable "ami_id" {
  description = "id ami"
  type        = string
}

variable "zone" {
  description = "zone launch instance"
  type        = string
}

variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "name instance"
  type        = string
}