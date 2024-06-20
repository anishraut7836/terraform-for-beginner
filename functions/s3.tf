
resource "aws_s3_bucket" "sonic_media" {
     bucket = var.bucket
  
}

resource "aws_s3_object" "upload_sonic_media" {
     bucket = aws_s3_bucket.sonic_media.id
     key =  substr(each.value, 7, 20)
     source = each.value
     for_each = var.media 

}