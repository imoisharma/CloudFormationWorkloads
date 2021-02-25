# start the basic bash shell script
#!/bin/bash 
set -x
# created two variables
cr=create
del=delete
# checking the if-elif and else condition, if the condition matches perform the certain actions
if  [ $1 = $cr ]
then
    echo "Importing the Key Pair ..."
    echo `aws ec2 import-key-pair --key-name "ephemeral-key" --public-key-material fileb://key/ephemeral-key.pub`
    echo "Key Imported, Succesfully!"
    echo "Your CloudFormation Stack CREATE_IN_PROGRESS BEGINS ..."
    echo `aws cloudformation create-stack --stack-name cf-stack --template-body file://cf-templates/ec2-launch-template.json --parameters file://ec2-parameters.json`
    echo "EC2 instance Resources Creation Initated ..."
    sleep 5
    echo "EC2 Resource creation may take up to 1-2 minutes or sometimes even more due to poor network, so please be patient ..."
    echo "EC2 Resources CREATE IN PROGRESS ..."
    sleep 10
    echo "Installing the Apache Server ..."
    sleep 20
    echo "Apache Server Installed, Sucessfully!"
    sleep 5
    echo "Waiting for your EC2 instance to assigned the Public Ip Address from Amazon IPV4 pool address ..."
    echo "Few more seconds to go ..."
    sleep 70
    echo `aws ec2 describe-instances | jq '.["Reservations"]|.[]|.Instances|.[]|.LaunchTime + "  "  + .PublicIpAddress' | sort -n > public_ip.txt`
    echo `tail -n 1 public_ip.txt` > URL
    echo `grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' URL > output-url`
    IP=`cat output-url`
    echo `cat output-url |xargs curl -o output -vvvvv`
    echo "Congratulations! You have successfully launched the Apache Server. Your Server is running at this IP Address: http://$IP" 
    echo " *Note- If the server is still loading the page, which means ec2-instance is still initializing the resources, so please be patient or check your ec2-instance status for here https://console.aws.amazon.com/ec2/home?#Instances:instanceState=running"
elif [ $1 = $del ]
then
    echo "Deleting Existing Ephemeral Key"
    echo `aws ec2 delete-key-pair --key-name ephemeral-key`
    sleep 10
    echo `aws cloudformation delete-stack --stack-name cf-stack`
    echo "Your CloudFormation Stack DELETE_IN_PROGRESS ..."
    sleep 5
    echo "Successfully, CloudFormation Stack Deleted!"
else
    echo "You provided wrong argument. Please pass the (create or delete) argument only. For example- 1. < ./deploy.sh create > for creating the CloudFormation Stack 2. < ./deploy.sh delete > for deleting the CloudFormation Stack "
fi
