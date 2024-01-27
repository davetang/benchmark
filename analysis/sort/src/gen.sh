#!/usr/bin/env bash

set -euo pipefail

DIR=$(dirname $(realpath $0))/..

SIZES=(
   1000000
   10000000
   100000000
   1000000000
)

for s in ${SIZES[@]}; do
   >&2 echo ${s}
   ${DIR}/bin/random ${s} > ${DIR}/data/${s}.txt
done

>&2 echo Done
exit 0
