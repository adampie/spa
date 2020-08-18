provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "us-east-2"
  region = "us-east-2"
}

provider "aws" {
  alias  = "us-west-1"
  region = "us-west-1"
}

provider "aws" {
  alias  = "us-west-2"
  region = "us-west-2"
}

provider "aws" {
  alias  = "af-south-1"
  region = "af-south-1"
}

provider "aws" {
  alias  = "ap-east-1"
  region = "ap-east-1"
}

provider "aws" {
  alias  = "ap-south-1"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "ap-northeast-2"
  region = "ap-northeast-2"
}

provider "aws" {
  alias  = "ap-southeast-1"
  region = "ap-southeast-1"
}

provider "aws" {
  alias  = "ap-southeast-2"
  region = "ap-southeast-2"
}

provider "aws" {
  alias  = "ap-northeast-1"
  region = "ap-northeast-1"
}

provider "aws" {
  alias  = "ca-central-1"
  region = "ca-central-1"
}

provider "aws" {
  alias  = "eu-central-1"
  region = "eu-central-1"
}

provider "aws" {
  alias  = "eu-west-1"
  region = "eu-west-1"
}

provider "aws" {
  alias  = "eu-west-2"
  region = "eu-west-2"
}

provider "aws" {
  alias  = "eu-south-1"
  region = "eu-south-1"
}

provider "aws" {
  alias  = "eu-west-3"
  region = "eu-west-3"
}

provider "aws" {
  alias  = "eu-north-1"
  region = "eu-north-1"
}

provider "aws" {
  alias  = "me-south-1"
  region = "me-south-1"
}

provider "aws" {
  alias  = "sa-east-1"
  region = "sa-east-1"
}

# Dashboard
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
      zone_id = dvo.domain_name == "singlepageapp.xyz" ? aws_route53_zone.dns.zone_id : aws_route53_zone.dns.zone_id
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


resource "aws_dynamodb_table" "spa" {
  name           = "spa"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "PK"
  range_key      = "SK"

  attribute {
    name = "PK"
    type = "S"
  }

  attribute {
    name = "SK"
    type = "S"
  }

  attribute {
    name = "REGION"
    type = "S"
  }

  attribute {
    name = "FCP"
    type = "S"
  }

  attribute {
    name = "TBT"
    type = "S"
  }

  attribute {
    name = "TTI"
    type = "S"
  }

  attribute {
    name = "PERFORMANCE"
    type = "S"
  }

  attribute {
    name = "ACCESSIBILITY"
    type = "S"
  }

  attribute {
    name = "BESTPRACTICES"
    type = "S"
  }

  attribute {
    name = "SEO"
    type = "S"
  }
  
  attribute {
    name = "PWA"
    type = "S"
  }
}