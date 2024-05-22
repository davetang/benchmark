#!/usr/bin/env bash

set -euo pipefail

if [[ ! -e filtered_feature_bc_matrix.h5 ]]; then
   wget -O filtered_feature_bc_matrix.h5 https://figshare.com/ndownloader/files/39546196
fi

>&2 echo Done
exit 0
