variable "bucket" {
  description = "Bucket name"
}

variable "cloudfront_access_identity_path" {
  description = "OAI for Cloudfront"
}

variable "origin_access_identity_iam_arn" {
  description = "OAI for Bucket policy"
}
