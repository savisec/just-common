# Just Common

Common justfiles to import into project-specific justfiles. This also contains `.envrc` files intended to be used with [direnv](https://direnv.net/).

# Usage

## CICD

Include the action [setup-just](https://github.com/savisec/github-actions/blob/ea2190e4bc975cc9cd1a0a0803a2b9124bde26e6/.github/actions/setup-just/action.yml#L19-L19) to install just and download this repo into a folder `.justfiles` at the root of the project.

## Local

1. Install direnv and just:
    ```shell
    brew install direnv
    brew install just
    ```
2. Clone this repo.
3. Run `/path/to/this/repo/link.py` from the root of the project you intend to use it in. For example, from the directory `~/code/hello-go` you should run `~/code/justfiles/link.py`. This will create a symlink `.justfiles` in the root of `hello-go` which points to this repo's `justfiles/` directory.
