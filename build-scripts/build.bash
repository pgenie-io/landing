#!/bin/bash
set -eo pipefail

mkdir -p dist
dhall --explain text --output dist/index.html <<< './src/index.dhall'
