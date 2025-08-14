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
        "bash workflow/scripts/system_info.sh "
        ">{log} 2>&1; "
        "bedtools intersect "
        "-a {input.a} "
        "-b {input.b} "
        "| tee {output} "
        ">>{log} 2>&1 "
