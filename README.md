# sandbox_dependencies

This repository contains different scripts to fetch several dependencies that are useful to analyze the Privacy Sandbox.

- [sandbox\_dependencies](#sandbox_dependencies)
- [Standalone Installation](#standalone-installation)
  - [Software Requirements](#software-requirements)
- [Description of Sandbox Dependencies](#description-of-sandbox-dependencies)
  - [Google Chrome Beta](#google-chrome-beta)
  - [Topics for the Web](#topics-for-the-web)
  - [Utils](#utils)

# Standalone Installation

Although, we provide below the instructions to install this repository on its own, in practice, we clone it as a submodule in our projects (see [here](https://github.com/yohhaan/topics_analysis) for instance).

## Software Requirements

**Requirement:** [Docker Engine](https://docs.docker.com/engine/install/)

- Clone this [sandbox_dependencies](https://github.com/yohhaan/sandbox_dependencies) repository:
   - `git clone git@github.com:yohhaan/sandbox_dependencies.git` (SSH)
   - `git clone https://github.com/yohhaan/sandbox_dependencies.git` (HTTPS)

- Note: the [`.devcontainer/`](.devcontainer/) directory contains the config for integration with VS Code (see [guide here](https://github.com/PoPETS-AEC/examples-and-other-resources/blob/main/resources/vs-code-docker-integration.md)).

- Then, follow either set of instructions (or install dependencies manually):

> <details><summary>Using the Docker image from the Container Registry</summary>
>
> This [GitHub workflow](.github/workflows/build-push-docker-image.yaml)
> automatically builds and pushes the Docker image to GitHub's Container Registry
> when the `Dockerfile` or the `requirements.txt` files are modified.
>
> 1. Pull the Docker image:
> ```bash
> docker pull ghcr.io/yohhaan/sandbox_dependencies:main
> ```
> 2. Launch the Docker container, attach the current working directory (i.e.,
> run from the root of the cloned git repository) as a volume, set the context
> to be that volume, and provide an interactive bash terminal:
> ```bash
> docker run --rm -it -v ${PWD}:/workspaces/sandbox_dependencies \
>     -w /workspaces/sandbox_dependencies \
>     --entrypoint bash ghcr.io/yohhaan/sandbox_dependencies:main
> ```
> </details>


> <details><summary>Using a locally built Docker image</summary>
>
> 1. Build the Docker image:
> ```bash
> docker build -t sandbox_dependencies:main .
> ```
> 2. Launch the Docker container, attach the current working directory (i.e.,
> run from the root of the cloned git repository) as a volume, set the context
> to be that volume, and provide an interactive bash terminal:
> ```bash
> docker run --rm -it -v ${PWD}:/workspaces/sandbox_dependencies \
>     -w /workspaces/sandbox_dependencies \
>     --entrypoint bash sandbox_dependencies:main
> ```
> </details>

# Description of Sandbox Dependencies

## Google Chrome Beta

`./fetch_latest_beta_deb.sh` downloads the latest `google-chrome-beta_current.deb` package in the `deb/` folder.

## Topics for the Web

We provide `model.tflite` and `override_list.pb.gz`. They normally need to be manually extracted from their installation path after installing Google Chrome Beta and enabling the Privacy Sandbox APIs (the Chrome setting page `chrome://topics-internals` displays where these 2 files are saved).

Run `./fetch_topics_web.sh`, to get the dependencies for our analysis of Topics for the Web under the `topics_web` folder.

## Utils

Run `./fetch_utils.sh` to get the following resources under the `utils` folder:

- [GNU Collaborative International Dictionary of English](https://gcide.gnu.org.ua/download)

- [Wordnet](https://wordnet.princeton.edu/)

- [Word2Vec](https://code.google.com/archive/p/word2vec/)

- [Public Suffix List](https://publicsuffix.org/)
