#!/bin/bash
set -eo pipefail

dhall format --transitive src/index-text.dhall
dhall format --transitive src/default-index.dhall
