#! /usr/bin/env bash
sourmash sketch dna -p k=21,k=31,k=51,abund,scaled=1000 \
        WTCHG_987946_IDT0467*.fastq.gz WTCHG_982919_IDT0467*.fastq.gz \
        --name JRH_1 -o JRH_1.sigs.zip

sourmash sketch dna -p k=21,k=31,k=51,abund,scaled=1000 \
        {WTCHG_987946_IDT0453,WTCHG_982919_IDT0453}*.fastq.gz \
        --name JRH_2 -o JRH_2.sigs.zip

sourmash sketch dna -p k=21,k=31,k=51,abund,scaled=1000 \
        {WTCHG_986563_IDT0671,WTCHG_982919_IDT0671}*.fastq.gz \
        --name JRH_3 -o JRH_3.sigs.zip

sourmash sketch dna -p k=21,k=31,k=51,abund,scaled=1000 \
        WTCHG_983810_IDT0419*.fastq.gz \
        --name JRH_4 -o JRH_4.sigs.zip

sourmash sketch dna -p k=21,k=31,k=51,abund,scaled=1000 \
        {WTCHG_987946_IDT0606,WTCHG_982919_IDT0606}*.fastq.gz \
        --name JRH_5 -o JRH_5.sigs.zip

sourmash sketch dna -p k=21,k=31,k=51,abund,scaled=1000 \
        WTCHG_983810_IDT0418*.fastq.gz \
        --name JRH_6 -o JRH_6.sigs.zip

sourmash sketch dna -p k=21,k=31,k=51,abund,scaled=1000 \
        {WTCHG_987946_IDT0661,WTCHG_982919_IDT0661}*.fastq.gz \
        --name JRH_7 -o JRH_7.sigs.zip

sourmash sketch dna -p k=21,k=31,k=51,abund,scaled=1000 \
        {WTCHG_986563_IDT0641,WTCHG_982919_IDT0641}*.fastq.gz \
        --name JRH_8 -o JRH_8.sigs.zip

sourmash sketch dna -p k=21,k=31,k=51,abund,scaled=1000 \
        WTCHG_983810_IDT0385*.fastq.gz \
        --name JRH_9 -o JRH_9.sigs.zip

sourmash sketch dna -p k=21,k=31,k=51,abund,scaled=1000 \
        {WTCHG_987946_IDT0603,WTCHG_982919_IDT0603}*.fastq.gz \
        --name JRH_10 -o JRH_10.sigs.zip


