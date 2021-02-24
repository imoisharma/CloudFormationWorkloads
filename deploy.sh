# #!/bin/bash
# "$1 (aws cloudformation create-stack --stack-name myteststack12 --template-body file://test.json --parameters file://parameters.json --profile mohit-ssa)"

#!/bin/bash
# echo `aws cloudformation create-stack --stack-name myteststack13 --template-body file://test.json --parameters file://parameters.json --profile mohit-ssa` 
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
    echo `aws s3 ls --profile mohit-ssa`
else
    echo "You provided wrong argument. Please pass the (create or delete) argument only. For example- sh ./deploy create or sh ./deploy delete"
fi 