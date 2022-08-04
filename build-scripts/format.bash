#!/bin/bash
set -eo pipefail

dhall format --transitive dhall/index-text.dhall
dhall format --transitive dhall/default-index.dhall
