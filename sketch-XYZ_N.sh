#! /bin/bash
for i in ???_?/*.fastq.gz
do
    name=$(basename $i .fastq.gz)
    sourmash sketch dna -p k=21,k=31,scaled=1000 $i --name "$name" -o ${name}.sig.gz
done
