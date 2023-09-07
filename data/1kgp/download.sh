#!/usr/bin/env bash

set -euo pipefail

cmd="docker run --rm -u $(id -u):$(id -g) -v $(pwd):$(pwd) -w $(pwd) davetang/aspera_connect:4.2.6.393"

# exome
if [[ ! -f ERR031940_1.fastq.gz ]]; then
   ${cmd} era-fasp@fasp.sra.ebi.ac.uk:vol1/fastq/ERR031/ERR031940/ERR031940_1.fastq.gz .
fi
if [[ ! -f ERR031940_2.fastq.gz ]]; then
   ${cmd} era-fasp@fasp.sra.ebi.ac.uk:vol1/fastq/ERR031/ERR031940/ERR031940_2.fastq.gz .
fi

# rna-seq
if [[ ! -f ERR188194_1.fastq.gz ]]; then
   ${cmd} era-fasp@fasp.sra.ebi.ac.uk:vol1/fastq/ERR188/ERR188194/ERR188194_1.fastq.gz .
fi
if [[ ! -f ERR188194_2.fastq.gz ]]; then
   ${cmd} era-fasp@fasp.sra.ebi.ac.uk:vol1/fastq/ERR188/ERR188194/ERR188194_2.fastq.gz .
fi

>&2 echo Done
exit 0
