#!/bin/env bash

pushd "/home/usr/Downloads/GpuTest_Linux_x64_0.7.0/"
timeout "$1" /home/usr/Downloads/GpuTest_Linux_x64_0.7.0/GpuTest /test=fur /fullscreen
popd

