#!/bin/bash
set -eo pipefail

dhall format --transitive dhall/index-text
dhall format --transitive dhall/default-index
