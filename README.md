# sandbox_dependencies

This repository contains different scripts to fetch several dependencies that
are useful to analyze the Privacy Sandbox.

- [sandbox\_dependencies](#sandbox_dependencies)
- [Standalone Installation](#standalone-installation)
  - [Software Requirements](#software-requirements)
- [Description of Sandbox Dependencies](#description-of-sandbox-dependencies)
  - [Google Chrome Beta](#google-chrome-beta)
  - [Topics for the Web](#topics-for-the-web)
  - [Utils](#utils)

# Standalone Installation

Although, we provide next the instructions to install this repository on its
own, in practice, we clone it as a submodule in our projects (see
[here](https://github.com/yohhaan/topics_analysis) for instance).

## Software Requirements

A `Dockerfile` is provided under `.devcontainer/` (for direct integration with
[VS Code](https://gist.github.com/yohhaan/b492e165b77a84d9f8299038d21ae2c9)). To
manually build the image and deploy the Docker container, follow the
instructions below:

**Requirement:** [Docker](https://www.docker.com/products/docker-desktop)

1. Build the Docker image:
```sh
docker build -t sandbox_dependencies .devcontainer/
```
2. Deploy a Docker container:
```sh
docker run --rm -it -v ${PWD}:/workspaces/sandbox_dependencies \
    -w /workspaces/sandbox_dependencies \
    --entrypoint bash sandbox_dependencies:latest
```

# Description of Sandbox Dependencies

## Google Chrome Beta

`./fetch_latest_beta_deb.sh` downloads the latest
`google-chrome-beta_current.deb` package in the `deb/` folder.

## Topics for the Web

We provide `model.tflite` and `override_list.pb.gz`. They normally need to be
manually extracted from their installation path after installing Google Chrome
Beta and enabling the Privacy Sandbox APIs (the Chrome setting page
`chrome://topics-internals` displays where these 2 files are saved).

Run `./fetch_topics_web.sh`, to get the dependencies for our analysis of Topics
for the Web under the `topics_web` folder.

## Utils

Run `./fetch_utils.sh` to get the following resources under the `utils` folder:

- [GNU Collaborative International Dictionary of
  English](https://gcide.gnu.org.ua/download)

- [Wordnet](https://wordnet.princeton.edu/)

- [Word2Vec](https://code.google.com/archive/p/word2vec/)

- [Public Suffix List](https://publicsuffix.org/)
