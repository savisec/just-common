# Allow imported recipes to be overridden
set allow-duplicate-recipes

# Use bash and fail immediately on errors
set shell := ["/usr/bin/env", "bash", "-euo", "pipefail", "-c"]

# Root of this file's parent directory
just_common_root := source_dir()

# "true" if we are running in CI
ci_mode := env_var_or_default("CI", "false")

# convenience inversion of ci_mode
# "true" if we are running in dev mode (not CI)
dev_mode := if ci_mode == "true" { "false" } else { "true" }

# Require a just variable to be non-empty
[group('util')]
_require-var name value:
    @if [ -z "{{value}}" ]; then \
        echo "Error: \"{{name}}\" is required and cannot be empty" >&2; \
        exit 1; \
    fi
