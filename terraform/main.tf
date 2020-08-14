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

resource "aws_route53_record" "validation" {
  for_each = {
    for dvo in aws_acm_certificate.acm.domain_validation_options : dvo.domain_name => {
      name    = dvo.resource_record_name
      record  = dvo.resource_record_value
      type    = dvo.resource_record_type
      zone_id = dvo.domain_name == "singlepageapp.xyz" ? data.aws_route53_zone.dns.zone_id : data.aws_route53_zone.dns.zone_id
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = each.value.zone_id
}

resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = aws_acm_certificate.acm.arn
  validation_record_fqdns = [for record in aws_route53_record.validation : record.fqdn]
}

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "oai"
}

module "dashboard" {
  source = "./modules/s3_cloudfront"

  domain                          = "singlepageapp.xyz"
  bucket                          = "spa-xyz-dashboard"
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
  acm_certificate_arn             = aws_acm_certificate.acm.arn
  cloudfront_access_identity_path = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
  origin_access_identity_iam_arn  = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
}
