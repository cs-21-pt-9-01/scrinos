#!/bin/env bash

# Number of runs
N=30
# The timeout for a run
TIMEOUT=60
# Total time = N * TIMEOUT

# Report progress on every X'th iteration
REPORTI=5

# CPU test loop - stress
raplrs --name "cpu_baseline" benchmark -n "$N" /home/usr/benchmark_data/scrinos/baseline/cpu_baseline.sh "$TIMEOUT"

#for ((i = 0; i < $N; i++))
#do
#  raplrs -n "cpu_baseline" benchmark stress --quiet --timeout "$TIMEOUT" --cpu 10

#  if (($i % $REPORTI == 0))
#  then
#    date +"[%Y-%m-%d %H:%M:%S] $i completed of $N in CPU loop"
#  fi
#done

# RAM test loop - stress
raplrs --name "ram_baseline" benchmark -n "$N" /home/usr/benchmark_data/scrinos/baseline/ram_baseline.sh "$TIMEOUT"
#for ((i = 0; i < $N; i++))
#do
#  stress --quiet --timeout "$TIMEOUT" --vm 10

#  if (($i % $REPORTI == 0))
#  then
#    date +"[%Y-%m-%d %H:%M:%S] $i completed of $N in RAM loop"
#  fi
#done

# GPU test loop - furmark
raplrs --name "gpu_baseline" benchmark -n "$N" /home/usr/benchmark_data/scrinos/baseline/gpu_baseline.sh "$TIMEOUT"

#pushd "/home/usr/Downloads/GpuTest_Linux_x64_0.7.0/"

#popd raplrs --name "gpu_baseline" benchmark timeout "$TIMEOUT" /home/usr/Downloads/GpuTest_Linux_x64_0.7.0/GpuTest /test=fur /fullscreen
# -n "$N"
#for ((i = 0; i < $N; i++))
#do
#  timeout "$TIMEOUT" /home/usr/Downloads/GpuTest_Linux_x64_0.7.0/GpuTest /test=fur /fullscreen##

#  if (($i % $REPORTI == 0))
#  then
#    date +"[%Y-%m-%d %H:%M:%S] $i completed of $N in GPU loop"
#  fi
#done

# Sleep loop - Idle
raplrs --name "sleep_baseline" benchmark -n "$N" /home/usr/benchmark_data/scrinos/baseline/sleep.sh "$TIMEOUT"

#for ((i = 0; i < $N; i++))
#do
#  sleep "$TIMEOUT"

#  if (($i % $REPORTI == 0))
#  then
#    date +"[%Y-%m-%d %H:%M:%S] $i completed of $N in idle loop"
#  fi
#done

