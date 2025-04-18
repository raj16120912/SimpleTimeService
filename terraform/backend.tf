#Create S3 Bucket
resource "aws_s3_bucket" "backendbucket" {
    bucket = "rajbackendbucket"
}

# Enabling versioning
resource "aws_s3_bucket_versioning" "version_control" {
    bucket = aws_s3_bucket.backendbucket.id
    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encrypt_my_s3_bucket" {
    bucket = aws_s3_bucket.backendbucket.id

    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
}

#Create DynamoDB for state locking
resource "aws_dynamodb_table" "statelock" {
    name = "state-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }
}