'use strict';

const AWS = require("aws-sdk");
const sqs = new AWS.SQS({apiVersion: '2012-11-05'});
const chromium = require("chrome-aws-lambda");
const lighthouse = require('lighthouse');
const reportGenerator = require('lighthouse/lighthouse-core/report/report-generator');

module.exports.lighthouse = async () => {
    let browser = null;
    let url = process.env.URL

    browser = await chromium.puppeteer.launch({
        args: chromium.args,
        defaultViewport: chromium.defaultViewport,
        executablePath: await chromium.executablePath,
        headless: chromium.headless,
        ignoreHTTPSErrors: true,
    });

    const {lhr} = await lighthouse(url, {
        port: (new URL(browser.wsEndpoint())).port,
        output: 'json',
        logLevel: 'info',
    });

    const json = reportGenerator.generateReport(lhr, 'json');

    const audits = JSON.parse(json).audits;
    const first_contentful_paint = audits['first-contentful-paint'].displayValue;
    const total_blocking_time = audits['total-blocking-time'].displayValue;
    const time_to_interactive = audits['interactive'].displayValue;

    const response = {
        "name": process.env.AWS_LAMBDA_FUNCTION_NAME,
        "date": Date.now(),
        "region": process.env.AWS_REGION,
        "fcp": first_contentful_paint,
        "tbt": total_blocking_time,
        "tti": time_to_interactive,
        "performance": lhr.categories['performance'].score,
        "accessibility": lhr.categories['accessibility'].score,
        "best-practices": lhr.categories['best-practices'].score,
        "seo": lhr.categories['seo'].score,
        "pwa": lhr.categories['pwa'].score,
    }

    await browser.close();

    let params = {
        MessageBody: response,
        QueueUrl: process.env.QUEUE_URL
    };

    sqs.sendMessage(params, function(err, data) {
        if (err) {
            console.log("Error", err);
        } else {
            console.log(data)
        }

    });

    return response
};
