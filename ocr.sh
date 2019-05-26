#!/usr/bin/env bash

. ./env.sh

cd ${WRKDIR}

echo "" > text.txt

for i in `ls *.tif | sed -e 's/out\(.*\)\.tif/\1/g'`
do
    tesseract out${i}.tif ${WRKDIR}/text${i} -l fra
    cat ${WRKDIR}/text${i}.txt >> text.txt
done

cd ..

