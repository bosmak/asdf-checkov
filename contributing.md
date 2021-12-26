# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

#
asdf plugin test checkov https://github.com/bosmak/asdf-checkov.git "checkov --help"
```

Tests are automatically run in GitHub Actions on push and PR.
