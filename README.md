# example_snakemake_apptainer_workflow

https://github.com/kilpert/example_snakemake_apptainer_workflow

## First run

```
git clone git@github.com:kilpert/example_snakemake_apptainer_workflow.git
cd example_snakemake_apptainer_workflow/
bash run.sh
```


## Run

Apptainer container (.sif) is built on the fly.

```
bash run.sh
```

## Apptainer (manually)

### Build container (.sif) from definition file (.def):
```
apptainer build --force --build-arg 'ENVIRONMENT_YAML=workflow/envs/bedtools.yaml' containers/bedtools.sif workflow/envs/apptainer.def
```

### Run the container:
```
apptainer run containers/bedtools.sif conda info
apptainer run containers/bedtools.sif conda list
apptainer run containers/bedtools.sif bedtools --version
```

### Run the container (with writable current directory)
```
apptainer run -B "$PWD":/work --pwd /work containers/bedtools.sif bedtools intersect -a test/a.bed -b test/b.bed | tee c.bed
```
