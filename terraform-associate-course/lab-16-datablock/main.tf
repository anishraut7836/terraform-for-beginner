data "aws_s3_bucket" "data_bucket" {
  bucket = "my-terraform-learning-bucket"
}

#Now, let's use information from that data lookup to create a new IAM policy to permit access to our new S3 bucket

resource "aws_iam_policy" "policy" {
  name        = "data_bucket_policy"
  description = "Deny access to my bucket"
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": "${data.aws_s3_bucket.data_bucket.arn}"
        }
    ]
  })
}

output "data-bucket-arn" {
  value = data.aws_s3_bucket.data_bucket.arn
}

output "data-bucket-domain-name" {
  value = data.aws_s3_bucket.data_bucket.bucket_domain_name
}

output "data-bucket-region" {
  value = "The ${data.aws_s3_bucket.data_bucket.id} bucket is located in ${data.aws_s3_bucket.data_bucket.region}"
}