#!/usr/bin/env node
import * as cdk from 'aws-cdk-lib';
import { HelloCdkStack } from '../lib/aws-cdk-s3-stack';

const app = new cdk.App();
new HelloCdkStack(app, 'HelloCdkStack');
