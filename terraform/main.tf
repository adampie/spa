resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "oai"
}

# https://spa.adampie.co.uk
module "dashboard" {
  source = "./modules/s3"

  bucket = "adampie-spa-dashboard"
}

# http://adampie-spa-s3.s3-website-us-east-1.amazonaws.com
module "s3" {
  source = "./modules/s3"

  bucket = "adampie-spa-s3"
}

# http://adampie-spa-s3-acceleration.s3-accelerate.amazonaws.com/index.html
module "s3_acceleration" {
  source = "./modules/s3_acceleration"

  bucket = "adampie-spa-s3-acceleration"
}

# https://spa-s3.adampie.co.uk
module "s3_cloudfront" {
  source = "./modules/s3_cloudfront"

  bucket                          = "adampie-spa-s3-cloudfront"
  cloudfront_access_identity_path = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
  origin_access_identity_iam_arn  = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
}

# https://spa-s3a.adampie.co.uk
module "s3_acceleration_cloudfront" {
  source = "./modules/s3_acceleration_cloudfront"

  bucket                          = "adampie-spa-s3-acceleration-cloudfront"
  cloudfront_access_identity_path = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
  origin_access_identity_iam_arn  = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
}
