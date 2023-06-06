# sandbox_dependencies

A repo with different dependencies for research on the Privacy Sandbox.

## Install

Most likely, this git project should be cloned as a submodule of another
project.

Use the provided `DockerFile` under `.devcontainer` (for easy integration with
[VS code](https://code.visualstudio.com/docs/devcontainers/containers)) to get
an environment with the necessary software dependencies.

Different shell scripts are provided to fetch several Privacy Sandbox's
dependencies as well as other useful things.

- Preliminary: copy manually: `model.tflite`, `override_list.pb.gz` `top-1m.csv`
`tranco_ID.csv` into a folder named `topics` at the root of the repository for
dependencies. These files are available here:
https://drive.google.com/drive/folders/1qmcVRAskIYdPLVGiD1CmPIPJK78SjL5B?usp=sharing
- To fetch all: `./fetch_all.sh`
- To download the latest `google-chrome-beta_current.deb` package:
  `./fetch_latest_beta_deb.sh`
- To get Topics dependencies (see preliminary): `./fetch_topics_dependencies.sh`
- To download utils: `./fetch_utils.sh`

## Topics

* `model.tflite` See `chrome://topics-internals` for path with Privacy Sandbox
  enabled
* `override_list.pb.gz` Same as above
* `Taxonomy`
  https://raw.githubusercontent.com/patcg-individual-drafts/topics/main/taxonomy_v1.md
* `page_topics_override_list.proto` Downloaded from chromium src code under BSD LICENSE.
  https://raw.githubusercontent.com/chromium/chromium/main/components/optimization_guide/proto/page_topics_override_list.proto

For now need to copy manually: `model.tflite`, `override_list.pb.gz` `top-1m.csv`
`tranco_ID.csv` into a folder named `topics` at the root of the repository for
dependencies.
These files are available here: https://drive.google.com/drive/folders/1qmcVRAskIYdPLVGiD1CmPIPJK78SjL5B?usp=sharing

## Utils

Download several things that could be useful.

* [GNU Collaborative International Dictionary of
  English](https://gcide.gnu.org.ua/download )
  >GNU CIDE is free dictionary; you can redistribute it and/or modify it under
  >the terms of the GNU General Public License as published by the Free Software
  >Foundation; either version 3 of the License, or (at your option) any later
  >version.

* [Wordnet](https://wordnet.princeton.edu/)

- [Word2Vec](https://code.google.com/archive/p/word2vec/)

- [Public Suffix List](https://publicsuffix.org/)