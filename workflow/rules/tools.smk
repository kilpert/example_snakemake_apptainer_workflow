rule tools_bedtools:
    input:
        a="test/a.bed",
        b="test/b.bed",
        sif="containers/bedtools.sif",
    output:
        "results/bedtools/c.bed"
    container: 
        "containers/bedtools.sif"
    log:
        "log/tools_bedtools.log"
    benchmark:
        ".benchmark/tools_bedtools.benchmark.tsv"
    shell:
        ## "apptainer run "
        ## "-B $PWD:/work --pwd /work "
        ## "{input.sif} "
        "echo $SHELL "
        ">{log} 2>&1; "
        "conda info "
        ">>{log} 2>&1; "
        "bedtools --version "
        ">>{log} 2>&1; "
        "bedtools intersect "
        "-a {input.a} "
        "-b {input.b} "
        "| tee {output} "
        ">>{log} 2>&1 "
