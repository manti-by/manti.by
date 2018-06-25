#!/usr/bin/env bash
cd "$(dirname $(dirname "$(pwd)"))"
circleci build --job build
circleci build --job migrate
circleci build --job test