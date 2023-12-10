#! /bin/bash
for i in *.fasta
do
    name=$(basename $i .fasta)
    sourmash sketch dna -p k=21,k=31,scaled=1000 $i --name "$name" -o ${name}.sig.gz
done
