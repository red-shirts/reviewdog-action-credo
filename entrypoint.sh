#!/bin/sh

cd "$GITHUB_WORKSPACE"

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"
export MIX_HOME=/var/mix

mix credo suggest --strict --format=flycheck \
    | reviewdog -efm="%f:%l:%c: %t: %m" -efm="%f:%l: %t: %m" -name="credo" -reporter="${INPUT_REPORTER:-'github-pr-check'}" -level="${INPUT_LEVEL}"
