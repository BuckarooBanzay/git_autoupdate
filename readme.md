
git repository auto updater
------------

# Overview

Auto-updates a git repository

# Environment variables

* **GIT_DIR** path to the git repo
* **GIT_BRANCH** branch to use (optional)

# Usage

```bash
docker run \
 -v /my/git/repo:/git \
 -e GIT_DIR=/git \
 -e GIT_BRANCH=master \
 buckaroobanzay/git_autoupdate
```

# License

MIT
