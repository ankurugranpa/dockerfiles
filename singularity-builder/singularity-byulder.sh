#!/bin/bash

filename="$1"
basename="${filename%.*}"

docker run --rm -it \
  --privileged \
  -v "$(pwd)":/mnt \
  ankuru/singularity-builder:latest \
  singularity build /mnt/$basename.sif /mnt/$filename
