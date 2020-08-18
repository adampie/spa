module "dashboard" {
  source = "./modules/s3_cloudfront"

  domain                          = "singlepageapp.xyz"
  bucket                          = "spa-xyz-dashboard"
  zone_id                         = aws_route53_zone.dns.zone_id
  acm_certificate_arn             = aws_acm_certificate.acm.arn
  cloudfront_access_identity_path = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
  origin_access_identity_iam_arn  = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
}

module "s3" {
  source = "./modules/s3"

  bucket = "spa-xyz-s3"
}

module "s3_acceleration" {
  source = "./modules/s3_acceleration"

  bucket = "spa-xyz-s3-acceleration"
}

module "s3_cloudfront" {
  source = "./modules/s3_cloudfront"

  domain                          = "us-east-1.singlepageapp.xyz"
  bucket                          = "spa-xyz-s3-cloudfront"
  zone_id                         = aws_route53_zone.dns.zone_id
  acm_certificate_arn             = aws_acm_certificate.acm.arn
  cloudfront_access_identity_path = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
  origin_access_identity_iam_arn  = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
}
