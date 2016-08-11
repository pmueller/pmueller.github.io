#!/bin/bash

USAGE="Usage:\n
./deploy.sh <-- does a dry run\n
./deploy.sh go <-- actually deploys";
if [ $# -eq 0 ]
  then
    echo -e $USAGE;
    echo "Running dry-run"
    rsync --dry-run -az --force --delete --progress -e "ssh -p22" ./src/ linode:pralzcom/
elif [ $1 == "go" ]
  then
    echo "Running actual deploy"
    rsync -az --force --delete --progress -e "ssh -p22" ./src/ linode:pralzcom/
fi
