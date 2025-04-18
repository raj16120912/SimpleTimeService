terraform {
  backend "s3" {
    bucket         = "rajbackendbucket"
    dynamodb_table = "state-lock"
    key            = "global/simplestatefile/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.95.0"
    }
  }
}

#Using AWS 
provider "aws" {
  region = "us-east-1"
}