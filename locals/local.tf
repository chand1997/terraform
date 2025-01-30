locals{
    # these cannot be overriden by cmd ,.tfvars, env vars..et
    ami_id = data.aws_ami.my_ami.id
    name = "Locals-demo"
}