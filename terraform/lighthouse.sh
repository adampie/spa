#!/usr/bin/env sh
mkdir lighthouse && cd lighthouse
npm install lighthouse
cd ..
zip -r lighthouse.zip lighthouse
rm -rf lighthouse
