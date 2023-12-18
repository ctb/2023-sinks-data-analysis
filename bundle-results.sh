#! /bin/bash
zip -r sinks-results-today.zip sink_metag/JRH_{?,??}.*{out,csv} \
    isolates.x.metagenomes.manysearch.csv isolates.x.metagenomes.summary.csv \
    sink_metag/JRH_combined.kreport.csv
