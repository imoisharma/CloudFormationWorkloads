======================
CloudFormationWorkloads
======================

This repo contains the simple script which provision the ec2 server on AWS which printing the simple html index
page that displaying the EC2 instance ID of the instance responding to the request.

Steps:
To deploy the Cloud Formation template, simply download or clone the repo and run `./deploy.sh create`.
Similarly for deleting the Cloud Formation template, simply run `./deploy.sh delete`

Getting Started
---------------
Assuming that you have Git & AWS CLI installed and set-up properly. 

.. code-block:: sh

    $ git clone https://github.com/boto/boto3.git
    $ cd CloudFormationWorkloads
    $ ./deploy.sh create #create the CF-Stack
    $ ./deploy.sh delete #delete the CF-Stack
.. code-block:: sh

=====
`*Attention`
=====

* AWS CLI must be Installed and configured. And, if you are using different AWS accounts, set up the profile tag accordingly (In the above deploy.sh script, I've provided my profile tag, you change accordingly if you are using profile tag. If not, removed it). 

Learn more about named profiles:

1. https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html
2. https://www.youtube.com/watch?v=Jhjp19bGakg 


* By default, parameter is set to `t2.micro` so if you want to use different instance type,set-up accordingly. Either, provide parameters attributes inside the ``ec2-parameters.json`` file or change the default attribute inside the ``ec2-launch-template.json`` file.


