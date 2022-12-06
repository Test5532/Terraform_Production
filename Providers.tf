terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.45.0"
    }
  }
}


provider "aws" {
  region  = "ap-south-1"
}


terraform {
  backend "s3" {
    encrypt = true    
    bucket = "production101bucket102"
    dynamodb_table = "PROD_TABLE"
    key    = "EverythingEverywhere/terraform.tfstate"
    region = "ap-south-1"
  }
}


/*
CHANGES
1. Provider
2. Region 
3. Profile
4. Bucket Name
5. Dynamo Db table name
6. Region in backend
*/




