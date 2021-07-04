=======================
 Cloud Formation Workloads
=======================

This repository contains the cloudformation templates for AWS services which can be used for deploying different services provided by AWS.

Steps:
To deploy the Cloud Formation template, simply download or clone the repo and run `./deploy.sh create`.
Similarly for deleting the Cloud Formation template, simply run `./deploy.sh delete`

Getting Started
---------------
Assuming that you have Git & AWS CLI installed and have set-up AWS account or have IAM user or assume-role access. 

=====
`*Attention`
=====

* AWS CLI must be Installed and configured. And, if you are using different AWS accounts, set up the profile tag accordingly (In the above deploy.sh script, I've provided my profile tag, you change accordingly if you are using profile tag. If not, removed it). 

Learn more about named profiles:

1. https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html
2. https://www.youtube.com/watch?v=Jhjp19bGakg 


* By default, parameter is set to `t2.micro` so if you want to use different instance type,set-up accordingly. Either, provide parameters attributes inside the ``ec2-parameters.json`` file or change the default attribute inside the ``ec2-launch-template.json`` file.


