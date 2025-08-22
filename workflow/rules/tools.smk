rule tools_bedtools:
    input:
        a="test/a.bed",
        b="test/b.bed",
        sif="containers/bedtools.sif",
    output:
        "{results}/bedtools/c.bed"
    container: 
        "containers/bedtools.sif"
    log:
        "{results}/log/tools_bedtools.log"
    benchmark:
        "{results}/.benchmark/tools_bedtools.benchmark.tsv"
    shell:
        "bash workflow/scripts/env_info.sh "
        ">{log} 2>&1; "
        "bedtools intersect "
        "-a {input.a} "
        "-b {input.b} "
        "| tee {output} "
        ">>{log} 2>&1 "


rule tools_bed_to_tsv:
    input:
        bed="{results}/bedtools/c.bed",
        sif="containers/python.sif",
    output:
        "{results}/bedtools/c.tsv"
    container:
        "containers/python.sif"
    log:
        "{results}/log/tools_bed_to_tsv.log"
    benchmark:
        "{results}/.benchmark/tools_bed_to_tsv.benchmark.tsv"
    shell:
        "bash workflow/scripts/env_info.sh "
        ">{log} 2>&1; "
        "python workflow/scripts/bed_to_tsv.py "
        "{input.bed} "
        "{output} "
        ">>{log} 2>&1 "

