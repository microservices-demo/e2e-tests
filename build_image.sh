#!/usr/bin/env bash

which nix-build 2>&1 > /dev/null

if [ $? -eq 0 ]; then
  echo "Building runner image via nix-build" >&2
  docker load < $(nix-build -A e2etest-image)
else
  echo "Building build-image via Docker" >&2
  builder_id=$(docker build -qf Dockerfile.build_test_container .)

  echo "Building test image" >&2
  docker run --rm $builder_id
  #| docker load
fi
