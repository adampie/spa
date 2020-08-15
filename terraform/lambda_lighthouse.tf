resource "aws_lambda_layer_version" "lighthouse-us-east-1" {
  filename   = "lighthouse.zip"
  layer_name = "lighthouse"

  compatible_runtimes = ["nodejs12.x"]
}

resource "aws_lambda_layer_version" "lighthouse-us-east-2" {
  provider   = aws.us-east-2
  filename   = "lighthouse.zip"
  layer_name = "lighthouse"

  compatible_runtimes = ["nodejs12.x"]
}

resource "aws_lambda_layer_version" "lighthouse-us-west-1" {
  provider   = aws.us-west-1
  filename   = "lighthouse.zip"
  layer_name = "lighthouse"

  compatible_runtimes = ["nodejs12.x"]
}

resource "aws_lambda_layer_version" "lighthouse-us-west-2" {
  provider   = aws.us-west-2
  filename   = "lighthouse.zip"
  layer_name = "lighthouse"

  compatible_runtimes = ["nodejs12.x"]
}

resource "aws_lambda_layer_version" "lighthouse-af-south-1" {
  provider   = aws.af-south-1
  filename   = "lighthouse.zip"
  layer_name = "lighthouse"

  compatible_runtimes = ["nodejs12.x"]
}

resource "aws_lambda_layer_version" "lighthouse-ap-east-1" {
  provider   = aws.ap-east-1
  filename   = "lighthouse.zip"
  layer_name = "lighthouse"

  compatible_runtimes = ["nodejs12.x"]
}

resource "aws_lambda_layer_version" "lighthouse-ap-south-1" {
  provider   = aws.ap-south-1
  filename   = "lighthouse.zip"
  layer_name = "lighthouse"

  compatible_runtimes = ["nodejs12.x"]
}

resource "aws_lambda_layer_version" "lighthouse-ap-northeast-2" {
  provider   = aws.ap-northeast-2
  filename   = "lighthouse.zip"
  layer_name = "lighthouse"

  compatible_runtimes = ["nodejs12.x"]
}

resource "aws_lambda_layer_version" "lighthouse-ap-southeast-1" {
  provider   = aws.ap-southeast-1
  filename   = "lighthouse.zip"
  layer_name = "lighthouse"

  compatible_runtimes = ["nodejs12.x"]
}

resource "aws_lambda_layer_version" "lighthouse-ap-southeast-2" {
  provider   = aws.ap-southeast-2
  filename   = "lighthouse.zip"
  layer_name = "lighthouse"

  compatible_runtimes = ["nodejs12.x"]
}

resource "aws_lambda_layer_version" "lighthouse-ap-northeast-1" {
  provider   = aws.ap-northeast-1
  filename   = "lighthouse.zip"
  layer_name = "lighthouse"

  compatible_runtimes = ["nodejs12.x"]
}
//
//resource "aws_lambda_layer_version" "lighthouse-ca-central-1" {
//  provider   = aws.ca-central-1
//  filename   = "lighthouse.zip"
//  layer_name = "lighthouse"
//
//  compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "lighthouse-eu-central-1" {
//  provider   = aws.eu-central-1
//  filename   = "lighthouse.zip"
//  layer_name = "lighthouse"
//
//  compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "lighthouse-eu-west-1" {
//  provider   = aws.eu-west-1
//  filename   = "lighthouse.zip"
//  layer_name = "lighthouse"
//
//  compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "lighthouse-eu-west-2" {
//  provider   = aws.eu-west-2
//  filename   = "lighthouse.zip"
//  layer_name = "lighthouse"
//
//  compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "lighthouse-eu-south-1" {
//  provider   = aws.eu-south-1
//  filename   = "lighthouse.zip"
//  layer_name = "lighthouse"
//
//  compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "lighthouse-eu-west-3" {
//  provider   = aws.eu-west-3
//  filename   = "lighthouse.zip"
//  layer_name = "lighthouse"
//
//  compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "lighthouse-eu-north-1" {
//  provider   = aws.eu-north-1
//  filename   = "lighthouse.zip"
//  layer_name = "lighthouse"
//
//  compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "lighthouse-me-south-1" {
//  provider   = aws.me-south-1
//  filename   = "lighthouse.zip"
//  layer_name = "lighthouse"
//
//  compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "lighthouse-sa-east-1" {
//  provider   = aws.sa-east-1
//  filename   = "lighthouse.zip"
//  layer_name = "lighthouse"
//
//  compatible_runtimes = ["nodejs12.x"]
//}
