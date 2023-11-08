#!/usr/bin/env bash

set -euo pipefail

wget -c https://s3.dev.maayanlab.cloud/archs4/files/human_gene_v2.2.h5
wget -c https://s3.dev.maayanlab.cloud/archs4/files/mouse_gene_v2.2.h5

>&2 echo Done
exit 0
