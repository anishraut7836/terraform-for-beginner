terraform {
  backend "s3" {
    bucket = "bucket-name"
    key = "finance/terraform.tfstate"
    region = "us-west-1"
    dynamodb_table = "state-locking"
  }
}

