#!/usr/bin/env python3

"""
Create a symlink to the justfiles directory in this repo.
This allows other projects to use these common justfiles from source, by having a single
clone of this repo on their system, which all other projects symlink to and import.
This also allows faster iteration on the common justfiles, since a branch can be
actively developed alongside a branch of another repo that depends on it.
"""

import sys
import shutil
from pathlib import Path

# Link to this path in the current directory
DEST_PATH = ".justfiles"

# prefer __file__ when present (the script file); fall back to argv[0]
if "__file__" not in globals():
    raise Exception("__file__ not found in globals. link.py must be run as a script.")

invoked = Path(__file__)

# if invoked was a bare name found on PATH, resolve it
if "/" not in str(invoked) and "\\" not in str(invoked):
    found = shutil.which(str(invoked))
    if found:
        invoked = Path(found)
    else:
        raise Exception(
            f"{invoked} not found on PATH. Cannot use this resolved path: {invoked}",
        )

# canonical absolute path (follows symlinks)
# then find the "justfiles" directory at the root of this repo
THIS_PATH = invoked.resolve(strict=False).parent / "justfiles"

# create symlink (adjust link_name as needed)
link_name = Path(DEST_PATH)
try:
    link_name.symlink_to(THIS_PATH)
except FileExistsError:
    print(f"{link_name} already exists", file=sys.stderr)
    sys.exit(1)
except OSError as e:
    print("symlink failed:", e, file=sys.stderr)
    sys.exit(1)
