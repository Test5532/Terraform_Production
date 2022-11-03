
/* 
# Create S3 Bucket

resource "aws_s3_bucket" "tf_course_bucket" {
  bucket = var.bucket_name
  tags = {
    Name        = var.Bucket_Name_Tag
    Environment = var.Bucket_Environment_Tag
  }
}

resource "aws_s3_bucket_versioning" "tf_course_bucket_versioning" {
  bucket = aws_s3_bucket.tf_course_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}


# Attach ACL to aws_s3_bucket named tf_course_bucket by using id of bucket

resource "aws_s3_bucket_acl" "tf_course_bucket_acl" {
  bucket = aws_s3_bucket.tf_course_bucket.id
  acl    = var.Bucket_acl
}


# Enable Server side Encryption 

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_course_bucket_encrypt" {
  bucket = aws_s3_bucket.tf_course_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
    
    sse_algorithm     = var.Bucket_sse_algorithm
    
    #  kms_master_key_id = aws_kms_key.mykey.arn
    #  sse_algorithm     = "aws:kms"

    }
  }
}

/*
CHANGES
1. Bucket name and Tags
2. Region 
3. Profile
4. Bucket Name
5. Dynamo DB table name
6. Region in backend
*/

