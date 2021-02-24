# start the basic bash shell script
#!/bin/bash 

# created two variables
cr=create
del=delete

# echo $1

# checking the if-elif and else condition, if the condition matches perform the certain actions
if  [ $1 = $cr ]
then
    # echo `aws ec2 import-key-pair --key-name "my-public-key" --public-key-material fileb://my-public-key.pub --profile mohit-ssa`
    echo "Your CloudFormation Stack CREATE_IN_PROGRESS ..."
    echo `aws cloudformation create-stack --stack-name myteststack --template-body file://test.json --parameters file://parameters.json --profile mohit-ssa`
    echo "EC2 instance Resource Creation Initated ..."
    sleep 5
    echo "this can take up to 1-2 minutes or sometimes even more due to poor network ..."
    sleep 120
    echo `aws ec2 describe-instances --profile mohit-ssa | jq '.["Reservations"]|.[]|.Instances|.[]|.LaunchTime + "  "  + .PublicIpAddress' | sort -n > public_ip.txt`
    echo `tail -n 1 public_ip.txt` > URL
    echo `grep -o '[0-9]\{2,3\}\.[0-9]\{2,3\}\.[0-9]\{2,3\}\.[0-9]\{2,3\}' URL > output-url`
    echo `file=cat output-url`
    echo `cat output-url |xargs curl -o output -vvvvv`
    echo "Congratulations! You've launched the Apache Server Sucessfully. To see the server, refer to this: https://$file"
    # echo `output`

elif [ $1 = $del ]
then
    echo "Your CloudFormation Stack DELETE_IN_PROGRESS ..."
    echo `aws cloudformation delete-stack --stack-name myteststack407 --profile mohit-ssa`
else
    echo "You provided wrong argument. Please pass the (create or delete) argument only. 
    For example- 
    1. './deploy.sh create' for creating the CloudFormation Stack
    2. './deploy.sh delete' for deleting the CloudFormation Stack"
# close the if 
fi 

# end of the script