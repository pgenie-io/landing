#!/bin/bash
set -eo pipefail

dhall version
mkdir -p dist
dhall --explain text --output dist/index.html <<< './src/index.dhall'
