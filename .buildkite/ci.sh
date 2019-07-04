#!/bin/bash

# Init
set -euo pipefail

# Change current branch since git is currently a detached HEAD. This is required for gitversion to work
git checkout -B ${BUILDKITE_BRANCH}
git reset --hard

# Run gitversion, mounting the repo root folder. Export the result as BUILD_NUMBER
docker run -v "$(pwd):/repo" gittools/gitversion-dotnetcore:linux /repo
export BUILD_NUMBER=$(docker run -v "$(pwd):/repo" gittools/gitversion-dotnetcore:linux /repo | jq -r ".LegacySemVer")
export DOCKER_TAG="leadhome/chromium-amplify-console:${BUILD_NUMBER} leadhome/chromium-amplify-console:latest"
echo "+++ :package: Building version ${BUILD_NUMBER}"

# Build docker image
docker build -t ${DOCKER_TAG} .

docker push ${DOCKER_TAG}
