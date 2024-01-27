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
         for MEM in 4G 8G 12G; do
            REALTIME=$(/usr/bin/time --format %e sort --parallel ${CPU} --buffer-size ${MEM} ${DIR}/data/${s}.txt 2>&1 > /dev/null)
            echo -e "${s},${i},${CPU},${MEM},${REALTIME}"
         done
      done
   done
done

>&2 echo Done
exit 0
