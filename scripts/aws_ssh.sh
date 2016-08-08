#!/bin/bash
# Example: ec2-login SHARED-jenkins
EB_ENV=$1

if [[ $# -ne 1 ]]; then
    echo "Please one argument."
    aws elasticbeanstalk describe-environments | grep EnvironmentName
    exit 1;
fi

ssh A13646@$(aws ec2 describe-instances --filter "Name=tag:Name,Values=$EB_ENV" --query 'Reservations[0].Instances[0].NetworkInterfaces[0].PrivateIpAddresses[0].PrivateIpAddress' --output text) -i ~/.ssh/id_rsa_adtech_servers -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null
