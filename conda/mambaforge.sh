#!/usr/bin/env bash

set -euo pipefail

apt-get update && apt-get install -y wget

url=https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh
script=$(basename ${url})
wget ${url} && bash ${script} -b -p ${HOME}/mambaforge
if [[ $? -eq 0 ]]; then
   rm ${script}
fi
export PATH=${HOME}/mambaforge/bin:${PATH}
{ time mamba env create -f rnaseq.yml; } 2> mambaforge_stderr.out

>&2 echo Done
exit 0
