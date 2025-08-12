rule containers_bedtools:
    input:
        yaml="workflow/envs/bedtools.yaml",
        definition="workflow/envs/bedtools.def",
    output:
        "containers/bedtools.sif"
    log:
        "log/containers_bedtools.log"
    benchmark:
        ".benchmark/containers_bedtools.benchmark.tsv"
    # singularity_args:
    #     "--cleanenv" ## "--no-home --contain --cleanenv"
    shell:
        "apptainer build "
        "--force "
        "--build-arg 'ENVIRONMENT_YAML={input.yaml}' "
        "{output} "
        "{input.definition} "
        ">{log} 2>&1 "

