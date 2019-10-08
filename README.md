# GitHub Action: Run vint with reviewdog

[![Docker Image CI](https://github.com/reviewdog/action-vint/workflows/Docker%20Image%20CI/badge.svg)](https://github.com/reviewdog/action-vint/actions)
[![Release](https://img.shields.io/github/release/reviewdog/action-vint.svg?maxAge=43200)](https://github.com/reviewdog/action-vint/releases)

This action runs [credo](https://github.com/rrrene/credo) with
[reviewdog](https://github.com/reviewdog/reviewdog) on pull requests to improve
code review experience.

## Inputs

### `github_token`

**Required**. Must be in form of `github_token: ${{ secrets.github_token }}`'.

### `level`

Optional. Report level for reviewdog [info,warning,error].
It's same as `-level` flag of reviewdog.

### `reporter`

Reporter of reviewdog command [github-pr-check,github-pr-review].
Default is github-pr-check.
github-pr-review can use Markdown and add a link to rule page in reviewdog reports.

## Example usage

### [.github/workflows/reviewdog.yml](.github/workflows/reviewdog.yml)

```yml
name: reviewdog
on: [pull_request]
jobs:
  credo:
    name: runner / credo
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - name: credo
        uses: hauleth/reviewdog-action-credo@v1
        with:
          github_token: ${{ secrets.github_token }}
          reporter: github-pr-review # Change reporter.
```
