module "ec2" {
  source = "../module"
  instance_type="t2.micro"
  name="Module-Demo-from-test"
  
}

output "ec2_output_module" {
  value       = module.ec2.ec2_output 
}

