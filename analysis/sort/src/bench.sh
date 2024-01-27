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
   for i in {1..3}; do
      for CPU in 1 2 4 8 12 16; do
         REALTIME=$(/usr/bin/time --format %e sort --parallel ${CPU} ${DIR}/data/${s}.txt 2>&1 > /dev/null)
         echo -e "${i},${s},${CPU},${REALTIME}"
      done
   done
done

>&2 echo Done
exit 0
