#!/usr/bin/bash

benchmarks=('crispy-doom' 'mochadoom' 'chocolate-doom')
n=2000
delay=300

cd "$1"

for benchmark in "${benchmarks[@]}"
do
	cd "${benchmark}"
	raplrs -i /home/usr/idle-data.json -n "$benchmark" benchmark /home/usr/rapl.rs/benchmark/macro/doom/"$benchmark".sh -n "$n"
	echo "sleeping for $delay seconds before next benchmark"
	cd ..
	sleep "${delay}"	
done
