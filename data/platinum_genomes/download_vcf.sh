#!/usr/bin/env bash

set -euo pipefail

if [[ ! -e NA12877.vcf.gz ]]; then
   wget ftp://platgene_ro:''@ussd-ftp.illumina.com/2017-1.0/hg38/small_variants/NA12877/NA12877.vcf.gz*
fi

if [[ ! -e NA12878.vcf.gz ]]; then
   wget ftp://platgene_ro:''@ussd-ftp.illumina.com/2017-1.0/hg38/small_variants/NA12878/NA12878.vcf.gz*
fi

>&2 echo Done
exit 0
