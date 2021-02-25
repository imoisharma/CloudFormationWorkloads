=======================
CloudFormationWorkloads
=======================

This repo contains the simple script which provision the ec2-server on AWS which printing the simple html index
page that displaying the EC2 instance ID of the instance responding to the request.

Steps:
To deploy the Cloud Formation template, simply download or clone the repo and run `./deploy.sh create`.
Similarly for deleting the Cloud Formation template, simply run `./deploy.sh delete`

Getting Started
---------------
Assuming that you have Python and ``virtualenv`` installed, set up your environment and install the required dependencies like this or you can install the library using ``pip``:

.. code-block:: sh

    $ git clone https://github.com/boto/boto3.git
    $ cd CloudFormationWorkloads
    $ ./deploy.sh create #create the CF-Stack
    $ ./deploy.sh delete #delete the CF-Stack
.. code-block:: sh

* Kind Attention *:

* AWS CLI must be Installed and configured. And, if you are using different AWS accounts, set up the profile accordingly (In the above deploy.sh script, I've provided my profile tag, you change accordingly if you are using profile tag. If not removed it)
* By default, parameter is set to `t2.micro` so if you want to use different instance type,set-up accordingly inside the parameters folder or inside the cf-template folder.

