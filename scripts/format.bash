#!/usr/bin/env bash

# format the asdf plugin scripts
shfmt --language-dialect bash --write \
	bin/* \
	lib/*.bash
