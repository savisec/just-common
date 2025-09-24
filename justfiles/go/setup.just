[group('setup')]
setup: install
    @echo "Setup complete."

[group('setup')]
install: install-tools
    go mod download

[group('setup')]
install-tools:
    # Not recommended to install from source, so we use brew (as recommended).
    # https://golangci-lint.run/docs/welcome/install/#install-from-sources
    # In CI, this is installed by an action.
    if [ "{{ dev_mode }}" = "true" ]; then \
        brew install golangci-lint; \
    fi

[group('setup')]
tidy:
    go mod tidy

[group('setup')]
generate:
    go generate ./...
