# #!/bin/bash
# "$1 (aws cloudformation create-stack --stack-name myteststack12 --template-body file://test.json --parameters file://parameters.json --profile mohit-ssa)"

#!/bin/bash
echo `aws cloudformation create-stack --stack-name myteststack13 --template-body file://test.json --parameters file://parameters.json --profile mohit-ssa` 
