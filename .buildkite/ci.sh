#!/bin/bash

# Init
set -euo pipefail

DOCKER_REPO="leadhome/chromium-amplify-console"

# Change current branch since git is currently a detached HEAD. This is required for gitversion to work
git checkout -B ${BUILDKITE_BRANCH}
git reset --hard

# Run gitversion, mounting the repo root folder. Export the result as BUILD_NUMBER
docker run -v "$(pwd):/repo" gittools/gitversion-dotnetcore:linux /repo
export BUILD_NUMBER=$(docker run -v "$(pwd):/repo" gittools/gitversion-dotnetcore:linux /repo | jq -r ".LegacySemVer")
export DOCKER_TAG="${DOCKER_REPO}:${BUILD_NUMBER} ${DOCKER_REPO}:latest"
echo "+++ :package: Building version ${BUILD_NUMBER}"

# Build docker image
docker build -t ${DOCKER_TAG} .

docker push ${DOCKER_REPO}
