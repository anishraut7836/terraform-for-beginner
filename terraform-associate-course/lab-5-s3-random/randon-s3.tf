resource "random_id" "randomness" {
  byte_length = 16
}
resource "aws_s3_bucket" "my-new-S3-bucket-random" {
  bucket = "my-new-tf-test-bucket-${random_id.randomness.hex}"

  tags = {
    Name    = "My S3 Bucket"
    Purpose = "Intro to Resource Blocks Lab"
  }
}

resource "aws_s3_bucket_ownership_controls" "my_new_bucket_acl-random" {   
  bucket = aws_s3_bucket.my-new-S3-bucket-random.id  
  rule {     
    object_ownership = "BucketOwnerPreferred"   
  }
}