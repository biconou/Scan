#!/bin/bash

SCAN_DIR=/mnt/DATA/nextcloud-sync/remi/Photos/__Scans

echo année : 
read PARAM_ANNEE
echo mois : 
read PARAM_MOIS
echo n film :
read PARAM_NFILM

DEST_SCAN_DIR=$SCAN_DIR/$PARAM_ANNEE/$PARAM_ANNEE$PARAM_MOIS-$PARAM_NFILM
echo Répertoire de destination : $DEST_SCAN_DIR

if [ ! -e $DEST_SCAN_DIR ]
then
	mkdir -p $DEST_SCAN_DIR/scan
else
	echo !! Attention, ce répertoire existe deja
	exit
fi

# ls profiles/*.ini > listeProfiles

# awk '{print NR " : " $0}' listeProfiles

# echo votre choix ?
# read CHOIX

# PROFILE_CHOIX=`awk -v n=$CHOIX 'NR==n {print}' listeProfiles`

# rm listeProfiles

# echo Profile choisi  $PROFILE_CHOIX

# awk -v annee=$PARAM_ANNEE -v mois=$PARAM_MOIS -v nfilm=$PARAM_NFILM '{ gsub(/@annee@/, annee); gsub(/@mois@/, mois); gsub(/@nfilm@/, nfilm); print}' "$PROFILE_CHOIX" > $DEST_SCAN_DIR/scanner.ini

# cd $DEST_SCAN_DIR
# cp scanner.ini /cygdrive/c/vuescan/vuescan.ini

# /cygdrive/c/vuescan/vuescan.exe scanner.ini &


