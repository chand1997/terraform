variable "instances" {
  type        = map
  default     = {
    frontend = "t3.micro"
    backend ="t3.micro"
    mysql ="t3.small"
  }
}
