#! /bin/bash

# make list of isolates
for i in isolate_assemblies/*.sig.gz; do echo $(pwd)/$i; done > list.isolate-assemblies.txt

# run manysearch
sourmash scripts manysearch -k 21 list.isolate-assemblies.txt \
    sink_metag/JRH_all.k21.sigs.zip -c 4  -t 0 \
    -o isolates.x.metagenomes.manysearch.csv

# summarize
./summarize-manysearch.py isolates.x.metagenomes.manysearch.csv -o isolates.x.metagenomes.summary.csv
