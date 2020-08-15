#!/usr/bin/env sh
git clone --depth=1 https://github.com/alixaxel/chrome-aws-lambda.git && \
cd chrome-aws-lambda && \
make chrome_aws_lambda.zip
cd ..
mv chrome-aws-lambda/chrome_aws_lambda.zip .
rm -rf chrome-aws-lambda
