#! /bin/bash

# make list of isolates
for i in *.sig.gz; do echo $(pwd)/$i; done > ../list.isolate-assemblies.txt

# run manysearch
sourmash scripts manysearch -k 21 list.isolate-assemblies.txt \
    sink_metag/JRH_all.k21.sigs.zip -c 4  -t 0 \
    -o isolates.x.metagenomes.manysearch.csv
