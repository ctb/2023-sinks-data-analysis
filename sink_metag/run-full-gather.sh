#! /bin/bash
for i in JRH_*.sigs.zip
do
   name=$(basename $i .sigs.zip)
   echo $name
   sourmash gather ${name}.sigs.zip /group/ctbrowngrp/sourmash-db/gtdb-rs214/gtdb-rs214-k21.zip --picklist all-md5.list.txt:match_md5:md5 -k 21 -o ${name}.k21.gather.csv > ${name}.k21.gather.out
done
