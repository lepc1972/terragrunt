# root.hcl
locals {
  region_hcl = find_in_parent_folders("region.hcl")
  region     = read_terragrunt_config(local.region_hcl).locals.region
}

#Configure remote backend
remote_state {
  backend = "s3"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    bucket = "terrabucketlepc"

    key            = "${path_relative_to_include()}.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "terratable"
  }
}

#Configure AWS provider
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "us-east-2"
}
EOF
}
