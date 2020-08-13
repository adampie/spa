resource "aws_acm_certificate" "acm" {
  domain_name               = "adampie.co.uk"
  subject_alternative_names = ["*.adampie.co.uk"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

module "dashboard" {
  source = "./modules/s3"

  bucket = "adampie-spa-dashboard"
}

module "s3" {
  source = "./modules/s3"

  bucket = "adampie-spa-s3"
}

module "s3_acceleration" {
  source = "./modules/s3_acceleration"

  bucket = "adampie-spa-s3-acceleration"
}

module "s3_cloudfront" {
  source = "./modules/s3_cloudfront"

  bucket = "adampie-spa-s3-cloudfront"
}

module "s3_acceleration_cloudfront" {
  source = "./modules/s3_acceleration_cloudfront"

  bucket = "adampie-spa-s3-acceleration-cloudfront"
}
