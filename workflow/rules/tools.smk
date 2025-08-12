rule tools_bedtools:
    input:
        a="test/a.bed",
        b="test/b.bed",
        sif="containers/bedtools.sif",
    output:
        "results/bedtools/c.bed"
    # container: 
        # workflow.source_path("containers/bedtools.sif")
    log:
        "log/tools_bedtools.log"
    benchmark:
        ".benchmark/tools_bedtools.benchmark.tsv"
    shell:
        ## apptainer run -B "$PWD":/work --pwd /work containers/bedtools.sif bedtools intersect -a test/a.bed -b test/b.bed | tee c.bed
        "apptainer run "
        "-B $PWD:/work --pwd /work "
        "{input.sif} "
        "bedtools intersect "
        "-a {input.a} "
        "-b {input.b} "
        "| tee {output} "
        ">{log} 2>&1 "
