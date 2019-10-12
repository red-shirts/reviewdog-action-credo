# GitHub Action: Run credo with reviewdog

[![Docker Image CI](https://github.com/red-shirts/reviewdog-action-credo/workflows/Docker%20Image%20CI/badge.svg)](https://github.com/red-shirts/reviewdog-action-credo/actions)
[![Release](https://img.shields.io/github/release/red-shirts/reviewdog-action-credo.svg?maxAge=43200)](https://github.com/red-shirts/reviewdog-action-credo/releases)

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
    container:
      image: elixir:1.9.1-slim
    steps:
      - uses: actions/checkout@v1
      - name: Install Dependencies
        run: |
          mix local.rebar --force
          mix local.hex --force
          mix deps.get
      - name: credo
        uses: red-shirts/reviewdog-action-credo@v1
        with:
          github_token: ${{ secrets.github_token }}
          reporter: github-pr-review # Change reporter.
```
