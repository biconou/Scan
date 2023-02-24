#!/usr/bin/env bash

. ./env.sh

cd ${WRKDIR}
rm *.jpg
rm scans.pdf
rm text.pdf


echo "+++ conversion des fichiers tiff en jpg"
for i in `ls *.tif | sed -e 's/out\(.*\)\.tif/\1/g'`
do
    echo ${i}
    convert out${i}.tif out${i}.jpg
done

echo "+++ assemblage des fichier jpg en un pdf"
# En cas d'erreur modifier le fichier /etc/ImageMagick-6/policy.xml
convert *.jpg scans.pdf

cd ../..

echo "+++ conversion du texte en pdf"
${JAVA_HOME}/bin/java -jar lib/pdfbox-app-2.0.15.jar TextToPDF ${WRKDIR}/text.pdf ${WRKDIR}/text.txt
echo "assemblage texte et image dans un seul pdf"
${JAVA_HOME}/bin/java -jar lib/pdfbox-app-2.0.15.jar PDFMerger ${WRKDIR}/scans.pdf ${WRKDIR}/text.pdf ${WRKDIR}/out.pdf


#kotlinc -classpath "${LIBDIR}/pdfbox-2.0.15.jar:${LIBDIR}/commons-logging-1.2.jar:${LIBDIR}/fontbox-2.0.15.jar" \
#    -script assemble.kts

mv ${WRKDIR}/out.pdf ${WRKDIR}/${DOC_NAME}.pdf
mv ${WRKDIR}/text.txt ${WRKDIR}/${DOC_NAME}.txt

rm ${WRKDIR}/*.jpg
#rm ${WRKDIR}/scans.pdf
#rm ${WRKDIR}/text.pdf
rm ${WRKDIR}/*.tif

