resource "aws_route53_zone" "dns" {
  name = "singlepageapp.xyz"
}

resource "aws_acm_certificate" "acm" {
  domain_name               = "singlepageapp.xyz"
  subject_alternative_names = ["*.singlepageapp.xyz"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

# resource "aws_route53_record" "validation" {
#   zone_id = aws_route53_zone.dns.zone_id
#   name    = aws_acm_certificate.acm.domain_validation_options.resource_record_name
#   type    = "CNAME"
#   ttl     = "300"
#   records = [aws_acm_certificate.acm.domain_validation_options.resource_record_value]
# }

# resource "aws_acm_certificate_validation" "cert" {
#   certificate_arn         = aws_acm_certificate.acm.arn
#   validation_record_fqdns = aws_route53_record.validation.*.fqdn
# }

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "oai"
}

module "dashboard" {
  source = "./modules/s3"

  bucket = "spa-xyz-dashboard"
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

  bucket                          = "spa-xyz-s3-cloudfront"
  cloudfront_access_identity_path = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
  origin_access_identity_iam_arn  = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
}
