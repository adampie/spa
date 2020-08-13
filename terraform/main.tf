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

  bucket = "spa.adampie.co.uk"
}

module "s3" {
  source = "./modules/s3"

  bucket = "spa1.adampie.co.uk"
}

module "s3_acceleration" {
  source = "./modules/s3_acceleration"

  bucket = "spa2.adampie.co.uk"
}
