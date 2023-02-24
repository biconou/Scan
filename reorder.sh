#!/usr/bin/bash

#WRKDIR="."

count=0

for i in `ls ${WRKDIR}/out*-verso.tif  | sort -r`
do
  count=$(($count + 2))
  echo "$count"
  echo ${i}
  idx=$(printf "%02d" $count)
  newname=`echo ${i} | sed "s/\(out\)\(.*\)\(-verso.*\)/\1$idx.tif/"`
  mv $i $newname
done

