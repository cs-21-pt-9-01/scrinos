#!/bin/env sh

# Number of runs
N=5
# The timeout for a run
TIMEOUT=3
# Total time = N * TIMEOUT

# Report progress on every X'th iteration
REPORTI=5

# CPU test loop - stress
for ((i = 0; i < $N; i++))
do
  stress --quiet --timeout "$TIMEOUT" --cpu 10

  if (($i % $REPORTI == 0))
  then
    date +"[%Y-%m-%d %H:%M:%S] $i completed of $N in CPU loop"
  fi
done

# RAM test loop - stress
for ((i = 0; i < $N; i++))
do
  stress --quiet --timeout "$TIMEOUT" --vm 10

  if (($i % $REPORTI == 0))
  then
    date +"[%Y-%m-%d %H:%M:%S] $i completed of $N in RAM loop"
  fi
done

# GPU test loop - furmark
for ((i = 0; i < $N; i++))
do
  timeout "$TIMEOUT" gputest /test=fur /fullscreen

  if (($i % $REPORTI == 0))
  then
    date +"[%Y-%m-%d %H:%M:%S] $i completed of $N in GPU loop"
  fi
done

# Sleep loop - Idle
for ((i = 0; i < $N; i++))
do
  sleep "$TIMEOUT"

  if (($i % $REPORTI == 0))
  then
    date +"[%Y-%m-%d %H:%M:%S] $i completed of $N in idle loop"
  fi
done

