variable "ami_id" {
  description = "id ami"
  type        = string
}

variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "instance name"
  type        = string
}

variable "subnet_id" {
  description = "id subnet"
  type        = string
}