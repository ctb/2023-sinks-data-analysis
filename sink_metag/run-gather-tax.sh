#! /bin/bash
set -e
set -x
for i in JRH_{?,??}.sigs.zip
do
   name=$(basename $i .sigs.zip)
   echo $name
   #sourmash tax metagenome -F human -g ${name}.k21.gather.csv -t gtdb-rs214.lineages.sqldb > ${name}.k21.human-tax.out
   #sourmash tax metagenome -F kreport -g ${name}.k21.gather.csv -t gtdb-rs214.lineages.sqldb > ${name}.kreport.out
done

sourmash tax metagenome -F lineage_summary --rank species -g JRH_{?,??}.k21.gather.csv -t gtdb-rs214.lineages.sqldb > all-samples.tax-summary.out
