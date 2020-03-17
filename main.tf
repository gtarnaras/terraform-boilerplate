provider "aws" {
  version                   = "~> 2.0"
  region                    = "us-east-1"
  shared_credentials_file   = "/Users/georgetarnaras/.aws/credentials"
  profile                   = "personal"
}

module "dev" {
  source = "./environments/dev"
}

# module "staging" {
#   source = "environments/stg"
# }

# module "production" {
#   source = "environments/prd"
# }