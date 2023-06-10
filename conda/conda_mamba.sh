#!/usr/bin/env bash

set -euo pipefail

apt-get update && apt-get install -y wget

url=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
script=$(basename ${url})
wget ${url} && bash ${script} -b -p ${HOME}/miniconda3
if [[ $? -eq 0 ]]; then
   rm ${script}
fi
export PATH=${HOME}/miniconda3/bin:${PATH}
conda install -y -c conda-forge -n base mamba
{ time mamba env create -f rnaseq.yml; } 2> conda_mamba_stderr.out

>&2 echo Done
exit 0
