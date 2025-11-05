#!/usr/bin/env bash


## cmd="snakemake -c 16 --use-conda -p --rerun-incomplete"
cmd="snakemake -c 16 -p --rerun-incomplete --sdm apptainer --apptainer-args='--cleanenv' --profile config/snakemake/profile_for_apptainer/" # --cleanenv: to stop environment variables from being passed to the container


## if [[ $(hostname) =~ "ikim" ]]; then
##     cmd=$(echo "$cmd --profile config/snakemake/profile_for_apptainer/")
## fi


echo "$cmd"
eval "$cmd"
