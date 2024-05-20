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

# Peripheral blood mononuclear cells (PBMCs) from a healthy donor (same donor as pbmc8k)
download https://cf.10xgenomics.com/samples/cell-exp/2.1.0/pbmc4k/pbmc4k_filtered_gene_bc_matrices.tar.gz

# 3k Pan T Cells from a Healthy Donor
download https://cf.10xgenomics.com/samples/cell-exp/2.1.0/t_3k/t_3k_filtered_gene_bc_matrices.tar.gz

>&2 echo Done
exit 0
