resource "aws_s3_bucket" "terraform-s3" {

    bucket = "${var.bucket-name}"
    versioning {
        enabled = true  
    }    

    lifecycle {
        prevent_destroy = true
    }

    tags = {
        Name        = "My bucket"
        Environment = "Dev"
    }

}