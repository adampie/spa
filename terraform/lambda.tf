resource "aws_lambda_layer_version" "us_east_1" {
  filename   = "chrome_aws_lambda.zip"
  layer_name = "chrome_aws_lambda"

  compatible_runtimes = ["nodejs12.x"]
}
