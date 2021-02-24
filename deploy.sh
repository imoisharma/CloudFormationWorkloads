#!/bin/bash 
cr=create
del=delete
#echo $1
if  [ $1 = $cr ]
then
    echo "Your CloudFormation Stack CREATE_IN_PROGRESS ..."
    echo `aws s3 ls` 
elif [ $1 = $del ]
then
    echo "Your CloudFormation Stack DELETE_IN_PROGRESS ..."
    echo `aws cloudformation create-stack --stack-name myteststack13 --template-body file://test.json --parameters file://parameters.json --profile mohit-ssa`
else
    echo "You provided wrong argument. Please pass the (create or delete) argument only. 
    For example- 
    1. ./deploy create for creating the CloudFormation Stack
    2. ./deploy delete for deleting the CloudFormation Stack"
fi 