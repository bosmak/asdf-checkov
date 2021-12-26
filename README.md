<div align="center">

# asdf-checkov [![Build](https://github.com/bosmak/asdf-checkov/actions/workflows/build.yml/badge.svg)](https://github.com/bosmak/asdf-checkov/actions/workflows/build.yml) [![Lint](https://github.com/bosmak/asdf-checkov/actions/workflows/lint.yml/badge.svg)](https://github.com/bosmak/asdf-checkov/actions/workflows/lint.yml)


[checkov](https://www.checkov.io/1.Welcome/What%20is%20Checkov.html) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add checkov
# or
asdf plugin add checkov https://github.com/bosmak/asdf-checkov.git
```

checkov:

```shell
# Show all installable versions
asdf list-all checkov

# Install specific version
asdf install checkov latest

# Set a version globally (on your ~/.tool-versions file)
asdf global checkov latest

# Now checkov commands are available
checkov --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/bosmak/asdf-checkov/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Gustavo Bosmak](https://github.com/bosmak/)
