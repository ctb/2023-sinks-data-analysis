#! /bin/bash

# make list of isolates
for i in isolate_assemblies/*.sig.gz; do echo $(pwd)/$i; done > list.isolate-assemblies.txt

# run manysearch
sourmash scripts manysearch -k 21 list.isolate-assemblies.txt \
    sweep_reads/all_sweep.sig.zip \
    -c 4  -t 0 \
    -o isolates.x.sweep.manysearch.csv

# summarize
./summarize-manysearch.py isolates.x.sweep.manysearch.csv -o isolates.x.sweep.summary.csv
