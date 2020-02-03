#!/bin/sh

export AWS_ACCESS_KEY_ID=$1
export AWS_SECRET_ACCESS_KEY=$2
export AWS_DEFAULT_REGION=$3

if [ -z "${AWS_ACCESS_KEY_ID}" ] || [ -z "${AWS_SECRET_ACCESS_KEY}" ] || [ -z "${AWS_DEFAULT_REGION}" ]
then
    exit 1
else
    hash=$(echo -n $GITHUB_REPOSITORY | md5sum | awk '{print $1}')
    bucket="aws-cloudformation-cli-managed-sourcebucket-${hash:0:15}"

    aws s3api create-bucket \
        --bucket $bucket \
        --region $AWS_DEFAULT_REGION \
        --create-bucket-configuration LocationConstraint=$AWS_DEFAULT_REGION

    echo ::set-output name=bucket::$bucket
fi