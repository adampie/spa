#!/usr/bin/env sh
mkdir nodejs && cd nodejs
npm install lighthouse chrome-aws-lambda
cd ..
zip -r lighthouse.zip nodejs
rm -rf nodejs
