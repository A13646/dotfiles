#!/bin/bash
# e.g. ftr
ENV=$1

if [[ $# -ne 1 ]]; then
    echo "Please one argument. ftr or prd"
    exit 1;
fi

ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i ~/.ssh/emr.pem hadoop@$(dig +short ${ENV}-hadoop.caprofitx.org)
