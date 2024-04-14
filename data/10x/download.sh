#!/usr/bin/env bash

set -euo pipefail

download(){
   URL=$1
   FILE=$(basename ${URL})
   if [[ ! -e ${FILE} ]]; then
      >&2 echo Downloading ${FILE}
      wget --quiet ${URL}
   else
      >&2 echo ${FILE} already exists
   fi
}

download https://cf.10xgenomics.com/samples/cell-exp/1.1.0/jurkat/jurkat_filtered_gene_bc_matrices.tar.gz
download https://cf.10xgenomics.com/samples/cell-exp/1.1.0/293t/293t_filtered_gene_bc_matrices.tar.gz
download https://cf.10xgenomics.com/samples/cell-exp/1.1.0/jurkat:293t_50:50/jurkat:293t_50:50_filtered_gene_bc_matrices.tar.gz

>&2 echo Done
exit 0
