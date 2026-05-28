#!/usr/bin/env bash

# lint the asdf plugin scripts
shellcheck --shell=bash --external-sources \
	bin/* --source-path=lib/ \
	lib/*.bash

shfmt --language-dialect bash --diff \
	bin/* \
	lib/*.bash
