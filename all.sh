#!/usr/bin/bash

. ./env.sh

NOW=`date +"%Y-%m-%d_%H%M%S"`
export DOC_NAME=${NOW}
export WRKDIR=`pwd`/wrk/${DOC_NAME}
mkdir -p ${WRKDIR}

double=$1

if [[ -n ${double} && ${double} = "double" ]]
then
    echo "scan recto/verso demandé"
else 
    echo "scan recto demandé"
fi

./scan.sh ${double}

./ocr.sh

./assemble.sh
