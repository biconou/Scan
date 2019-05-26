#!/usr/bin/env bash

. ./env.sh

#pour recto/verso ajouter --batch-double
scanimage \
    -d ${DEVICE} \
    --format tiff \
    --batch=${WRKDIR}/out%02d.tif \
    --batch-start 1


