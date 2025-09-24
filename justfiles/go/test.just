
# Unit tests only (no integration)
[group('test')]
test coverage="false":
    #!/usr/bin/env bash
    set -euo pipefail

    coverage_flags=""
    if [ "{{ coverage }}" = "true" ]; then
        coverage_flags="-v -coverprofile=coverage.out"
    fi

    go test $coverage_flags $(go list ./... | grep -v /tests/integration)

    if [ "{{ coverage }}" = "true" ]; then
        go tool cover -html=coverage.out -o coverage.html
    fi

# Integration tests only
[group('test')]
integration-test:
    go test "./tests/integration/..."

# Lint (w/ fix if dev mode)
[group('lint')]
lint:
    fix_flag="{{ if dev_mode == "true" { "--fix" } else { "" } }}"; \
    golangci-lint run $fix_flag

# Format all code
[group('lint')]
fmt:
    go fmt ./...
