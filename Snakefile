KSIZES=[21, 31, 51]

rule all:
    input:
        expand("isolates.x.sweep.{k}.summary.csv", k=KSIZES),
        expand("isolates.x.sweep.{k}.summary.clusterplot.png", k=KSIZES),
        expand("isolate_assemblies/ecoli.{k}.cmp.matrix.png", k=KSIZES)
    output:
        "sinks-results-today.zip"
    shell: """
        zip {output} {input}
    """


rule manysearch_isolates_vs_sweep:
    input:
        querylist="list.isolate-assemblies.txt",
        metag="sweep_reads/all_sweep.sig.zip",
    output:
        "isolates.x.sweep.{k}.manysearch.csv"
    threads: 4
    shell: """
        sourmash scripts manysearch -k {wildcards.k} {input.querylist} \
            {input.metag} \
            -c {threads} -t 0 -o {output}
    """

rule summarize_isolates_vs_sweep:
    input:
        "isolates.x.sweep.{k}.manysearch.csv"
    output:
        "isolates.x.sweep.{k}.summary.csv"
    shell: """
        ./summarize-manysearch.py {input} -o {output}
    """

rule summarize_clusterplot:
    input: "isolates.x.sweep.{k}.summary.csv",
    output: "isolates.x.sweep.{k}.summary.clusterplot.png",
    shell: """
        ./plot-isolates-vs-sweep.py {input} -o {output}
    """

rule plot_ecoli_isolate_comparison:
    output:
        "isolate_assemblies/ecoli.{k}.cmp.matrix.png",
    shell: """
        sourmash compare isolate_assemblies/CUI_{{5,8}}_ecoli*.sig.gz -k {wildcards.k} -o isolate_assemblies/CUI_58_ecoli.{wildcards.k}.cmp --containment
        sourmash compare isolate_assemblies/*_ecoli*.sig.gz -k {wildcards.k} -o isolate_assemblies/ecoli.{wildcards.k}.cmp --containment
        sourmash plot isolate_assemblies/CUI_58_ecoli.{wildcards.k}.cmp --output-dir isolate_assemblies
        sourmash plot isolate_assemblies/ecoli.{wildcards.k}.cmp --output-dir isolate_assemblies
    """
    
