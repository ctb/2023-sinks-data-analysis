#! /bin/bash
find . -name \*.fastq.gz > sweep_reads.txt

for filename in $(cat sweep_reads.txt)
do
    name=$(basename $filename .fastq.gz)
    sourmash sketch dna -p k=21,k=31,k=51,abund $filename \
             -o ${name}.sig.zip --name ${name}
done
