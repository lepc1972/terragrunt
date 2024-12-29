# ec2/terragrunt.hcl
include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "tfr:///terraform-aws-modules/ec2-instance/aws?version=5.7.1"
}

dependency "vpc" {
config_path = "../vpc"
skip_outputs = false

mock_outputs = {
    private_subnets = ["mock-subnet"]
  }

  mock_outputs_allowed_terraform_commands = ["plan"]
}
  


inputs = {
  name = "terraec2instance"

  instance_type = "t3.micro"
  monitoring    = true
  subnet_id     = dependency.vpc.outputs.private_subnets[0]

  tags = {
    IaC         = "true"
    Environment = "dev"
  }
}
