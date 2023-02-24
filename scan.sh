#!/usr/bin/env bash

. ./env.sh

double=$1

if [[ -n ${double} && ${double} = "double" ]]
then
    echo "scan recto/verso demandé"
    scanimage \
    -d ${DEVICE} \
    --format tiff \
    --batch=${WRKDIR}/out%02d.tif \
    --batch-double \
    --batch-start 1

    echo "appuyer sur ENTER pour le verso"
    read

    scanimage \
        -d ${DEVICE} \
        --format tiff \
        --batch=${WRKDIR}/out%02d-verso.tif \
        --batch-double \
        --batch-start 2

    ./reorder.sh
else
    echo "scan recto demandé"
    scanimage \
    -d ${DEVICE} \
    --format tiff \
    --batch=${WRKDIR}/out%02d.tif \
    --batch-start 1
fi


# #pour recto/verso ajouter --batch-double
# scanimage \
#     -d ${DEVICE} \
#     --format tiff \
#     --batch=${WRKDIR}/out%02d.tif \
# #    --batch-double \
#     --batch-start 1

# echo "appuyer sur ENTER pour le verso"
# read

# # scanimage \
# #     -d ${DEVICE} \
# #     --format tiff \
# #     --batch=${WRKDIR}/out%02d.tif \
# #     --batch-double \
# #     --batch-start 2

