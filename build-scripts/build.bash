#!/bin/bash
set -eo pipefail

rm -rf dist/*
mkdir -p dist
dhall --explain text --output dist/index.html <<< './src/index.dhall'
cp static/* dist
