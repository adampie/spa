resource "aws_lambda_layer_version" "us-east-1" {
  filename   = "chrome_aws_lambda.zip"
  layer_name = "chrome_aws_lambda"

  compatible_runtimes = ["nodejs12.x"]
}

resource "aws_lambda_layer_version" "us-east-2" {
  provider = aws.us-east-2
  filename   = "chrome_aws_lambda.zip"
  layer_name = "chrome_aws_lambda"

  compatible_runtimes = ["nodejs12.x"]
}

resource "aws_lambda_layer_version" "us-west-1" {
  provider = aws.us-west-1
  filename   = "chrome_aws_lambda.zip"
  layer_name = "chrome_aws_lambda"

  compatible_runtimes = ["nodejs12.x"]
}

resource "aws_lambda_layer_version" "us-west-2" {
  provider = aws.us-west-2
  filename   = "chrome_aws_lambda.zip"
  layer_name = "chrome_aws_lambda"

  compatible_runtimes = ["nodejs12.x"]
}
//
//resource "aws_lambda_layer_version" "af-south-1" {
//provider = aws.af-south-1
//filename   = "chrome_aws_lambda.zip"
//layer_name = "chrome_aws_lambda"
//
//compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "ap-east-1" {
//provider = aws.ap-east-1
//filename   = "chrome_aws_lambda.zip"
//layer_name = "chrome_aws_lambda"
//
//compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "ap-south-1" {
//provider = aws.ap-south-1
//filename   = "chrome_aws_lambda.zip"
//layer_name = "chrome_aws_lambda"
//
//compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "ap-northeast-2" {
//provider = aws.ap-northeast-2
//filename   = "chrome_aws_lambda.zip"
//layer_name = "chrome_aws_lambda"
//
//compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "ap-southeast-1" {
//provider = aws.ap-southeast-1
//filename   = "chrome_aws_lambda.zip"
//layer_name = "chrome_aws_lambda"
//
//compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "ap-southeast-2" {
//provider = aws.ap-southeast-2
//filename   = "chrome_aws_lambda.zip"
//layer_name = "chrome_aws_lambda"
//
//compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "ap-northeast-1" {
//provider = aws.ap-northeast-1
//filename   = "chrome_aws_lambda.zip"
//layer_name = "chrome_aws_lambda"
//
//compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "ca-central-1" {
//provider = aws.ca-central-1
//filename   = "chrome_aws_lambda.zip"
//layer_name = "chrome_aws_lambda"
//
//compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "eu-central-1" {
//provider = aws.eu-central-1
//filename   = "chrome_aws_lambda.zip"
//layer_name = "chrome_aws_lambda"
//
//compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "eu-west-1" {
//provider = aws.eu-west-1
//filename   = "chrome_aws_lambda.zip"
//layer_name = "chrome_aws_lambda"
//
//compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "eu-west-2" {
//provider = aws.eu-west-2
//filename   = "chrome_aws_lambda.zip"
//layer_name = "chrome_aws_lambda"
//
//compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "eu-south-1" {
//provider = aws.eu-south-1
//filename   = "chrome_aws_lambda.zip"
//layer_name = "chrome_aws_lambda"
//
//compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "eu-west-3" {
//provider = aws.eu-west-3
//filename   = "chrome_aws_lambda.zip"
//layer_name = "chrome_aws_lambda"
//
//compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "eu-north-1" {
//provider = aws.eu-north-1
//filename   = "chrome_aws_lambda.zip"
//layer_name = "chrome_aws_lambda"
//
//compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "me-south-1" {
//provider = aws.me-south-1
//filename   = "chrome_aws_lambda.zip"
//layer_name = "chrome_aws_lambda"
//
//compatible_runtimes = ["nodejs12.x"]
//}
//
//resource "aws_lambda_layer_version" "sa-east-1" {
//provider = aws.sa-east-1
//filename   = "chrome_aws_lambda.zip"
//layer_name = "chrome_aws_lambda"
//
//compatible_runtimes = ["nodejs12.x"]
//}
