#!/bin/bash
set -eo pipefail

mkdir -p dist
./build-scripts/format.bash

dhall --explain text --output dist/index.html <<< './src/index-text.dhall ./src/default-index.dhall'
