#!/usr/bin/env bash

set -euo pipefail

if [[ $# -lt 1 ]]; then
   >&2 echo "Usage: $0 <cmd>"
   exit 1
fi

cmd=$1
shift
param=$@

command -p time \
--format \
"command,%C
elapsed_real_time,%E
elapsed_real_time_sec,%e
perc_cpu,%P
user_cpu,%U
sys_cpu,%S
avg_total_mem,%K KB
max_rss,%M KB
avg_rss,%t KB
sys_page_size,%Z B
avg_size_unshared_data_area,%D Kb
avg_unshared_stack_size,%p Kb
major_page_faults,%F
minor_page_faults,%R
num_filesys_inputs,%I
num_filesys_outputs,%O
num_swap,%W
avg_shared_txt,%X
num_signals,%k
num_socket_msg_received,%r
num_socket_msg_sent,%s
num_context_switched_vol,%w
num_context_switched_invol,%c
rc,%x" \
$(realpath ${cmd}) ${param}
