#!/usr/bin/env bash


cmd="snakemake -c 16 --use-conda -p --rerun-incomplete --sdm apptainer --apptainer-args='--cleanenv'" # to stop environment variables from being passed to the container


if [[ $(hostname) =~ "ikim" ]]; then
    cmd=$(echo "$cmd --profile humgen")
fi


echo "$cmd"
eval "$cmd"
