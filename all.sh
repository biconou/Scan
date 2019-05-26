#!/usr/bin/env bash

. ./env.sh

rm -rf ${WRKDIR}
mkdir ${WRKDIR}

./scan.sh

./ocr.sh

./assemble.sh
