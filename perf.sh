#!/bin/bash
now=$(date +%m-%d-%H-%M)
log_memory_file="perf-${now}-mem.log"
log_cpu_file="perf-${now}-cpu.log"
echo "Logging mem and cpu to ${log_memory_file} ${log_memory_file}"

# nohup 
sar -r 5 > ./logs/$log_mem_file &
sar -u 5 > ./logs/$log_cpu_file &