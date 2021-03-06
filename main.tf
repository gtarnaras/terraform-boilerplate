provider "aws" {
  version                 = "~> 2.0"
  region                  = "us-east-1"
  shared_credentials_file = "{{ shared_credentials_file }}"
  profile                 = "{{ profile }}"
}

module "{{ env }}" {
  source = "./environments/{{ env }}"
}

