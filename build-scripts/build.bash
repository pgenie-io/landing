#!/bin/bash
set -eo pipefail

mkdir -p dist
./build-scripts/format.bash

dhall --explain text --output dist/index.html <<< './dhall/index-text.dhall ./dhall/default-index.dhall'
