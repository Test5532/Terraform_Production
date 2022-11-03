/*

 resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = var.dynamodb_table_name
  hash_key = "LockID"
  read_capacity = 1
  write_capacity = 1
 
  attribute {
    name = "LockID"
    type = "S"
  }
}

*/