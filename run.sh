#!/usr/bin/env bash

## snakemake -c 16 --use-conda -p --rerun-incomplete ## --profile humgen
## snakemake -c 16 --use-conda -p --rerun-incomplete --software-deployment-method apptainer
snakemake -c 16 --use-conda -p --rerun-incomplete --sdm "apptainer" --apptainer-args="--cleanenv" # to stop environment variables from being passed to the container
