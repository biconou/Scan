#!/usr/bin/env bash

. ./env.sh

cd ${WRKDIR}

for i in `ls *.tif | sed -e 's/out\(.*\)\.tif/\1/g'`
do
    convert out${i}.tif out${i}.jpg
done

convert *.jpg out-tiff.pdf

cd ..

java -jar lib/pdfbox-app-2.0.15.jar TextToPDF ${WRKDIR}/out-txt.pdf ${WRKDIR}/text.txt

java -jar lib/pdfbox-app-2.0.15.jar PDFMerger ${WRKDIR}/out-tiff.pdf ${WRKDIR}/out-txt.pdf ${WRKDIR}/out.pdf


#kotlinc -classpath "${LIBDIR}/pdfbox-2.0.15.jar:${LIBDIR}/commons-logging-1.2.jar:${LIBDIR}/fontbox-2.0.15.jar" \
#    -script assemble.kts

