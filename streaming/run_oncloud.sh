#!/bin/bash

if [ "$#" -lt 3 ]; then
   echo "Usage:   ./run_oncloud.sh project-name bucket-name classname [options] "
   echo "Example: ./run_oncloud.sh cloud-training-demos cloud-training-demos CurrentConditions --bigtable"
   exit
fi

PROJECT=$1
shift
BUCKET=$1
shift
MAIN=com.google.cloud.training.dataanalyst.sandiego.$1
shift

echo "Launching $MAIN project=$PROJECT bucket=$BUCKET $*"

export PATH=/usr/lib/jvm/java-8-openjdk-amd64/bin/:$PATH
mvn compile -e exec:java -Dexec.mainClass=AverageSpeeds -Dexec.args="--project=datademo-340415 --stagingLocation=gs://datademo-340415/staging/ $* --tempLocation=gs:///staging/ --runner=DataflowRunner --maxNumWorkers=2 --workerMachineType=n1-standard-2"

