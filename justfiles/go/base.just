import '../base.just'
import './setup.just'
import './test.just'
import './build.just'

# Folder to build our project's binaries into (not for tools).
# justfile_dir() is the parent dir of the root just file that this justfile was imported from.
export PROJECT_BIN := canonicalize(justfile_dir()) / 'bin'

# Setup & validate
[group('setup')]
default: setup lint test
