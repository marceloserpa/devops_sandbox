#!/bin/bash

aws cloudformation deploy --template-file ec2-deploy.yaml \ 
    --stack-name hello-cloudformation \
    --parameter-overrides \
    ApplicationAMI=ami-0cfa11357157db4ba