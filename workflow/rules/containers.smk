rule containers_bedtools:
    input:
        yaml="workflow/envs/bedtools.yaml",
        definition="workflow/envs/apptainer.def",
    output:
        "containers/bedtools.sif"
    log:
        "log/containers_bedtools.log"
    benchmark:
        ".benchmark/containers_bedtools.benchmark.tsv"
    shell:
        "apptainer build "
        "--force "
        "--build-arg 'ENVIRONMENT_YAML={input.yaml}' "
        "{output} "
        "{input.definition} "
        ">{log} 2>&1 "


rule containers_samtools:
    input:
        yaml="workflow/envs/samtools.yaml",
        definition="workflow/envs/apptainer.def",
    output:
        "containers/samtools.sif"
    log:
        "log/containers_samtools.log"
    benchmark:
        ".benchmark/containers_samtools.benchmark.tsv"
    shell:
        "apptainer build "
        "--force "
        "--build-arg 'ENVIRONMENT_YAML={input.yaml}' "
        "{output} "
        "{input.definition} "
        ">{log} 2>&1 "
