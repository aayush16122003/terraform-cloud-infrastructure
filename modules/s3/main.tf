resource "aws_s3_bucket" "project_bucket" {

  bucket = "aayush-devops-tf-987654"

  tags = {

    Name = "TerraformProjectBucket"

  }

}