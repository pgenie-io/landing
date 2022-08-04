#!/bin/bash
set -eo pipefail

dhall format --transitive src/index.dhall
