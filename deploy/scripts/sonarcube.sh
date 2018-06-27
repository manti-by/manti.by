#!/usr/bin/env bash
cd "$(dirname $(dirname "$(pwd)"))"
sonar-scanner \
  -Dsonar.projectKey=manti.by \
  -Dsonar.organization=manti-by-github \
  -Dsonar.sources=./app \
  -Dsonar.host.url=https://sonarcloud.io \
  -Dsonar.login=17d12100b8cf288e141f6bb443a5a35f1f1de83e