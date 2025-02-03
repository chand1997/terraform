variable "instance_type" {
  type        = string
  default     = "t3.micro"
  validation{
        condition = contains(["t2.micro", "t3.micro","t2.small"],var.instance_type)
        error_message= "The options are t2.micro, t3.micro,t2.small"
  } 
}


variable "name"{
    type = string
     validation {
    condition     = length(var.name) > 5
    error_message = "Name cannot be empty."
  }
    
}
