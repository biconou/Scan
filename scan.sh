#!/usr/bin/env bash

DEVICE="brother4:net1;dev0"
WRKDIR=wrk

rm -rf ${WRKDIR}; mkdir ${WRKDIR}
cd ${WRKDIR}

scanimage -d ${DEVICE} --format tiff --batch --batch-double
for i in `ls *.tif | sed -e 's/out\(.*\)\.tif/\1/g'`
do
    tesseract out${i}.tif text${i} -l fra
    convert out${i}.tif out${i}.jpg
done

convert *.jpg out.pdf
