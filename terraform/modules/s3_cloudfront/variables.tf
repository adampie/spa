variable "bucket" {
  description = "Bucket name"
}

variable "cloudfront_access_identity_path" {
  description = "OAI for Cloudfront"
}

variable "origin_access_identity_iam_arn" {
  description = "OAI for Bucket policy"
}

variable "domain" {
  description = "Domain for Cloudfront"
}

variable "acm_certificate_arn" {
  description = "ACM Certificate for Cloudfront"
}

variable "zone_id" {
  description = "Zone id for Route 53"
}