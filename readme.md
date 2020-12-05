
git repository auto updater
------------

# Overview

Auto-updates a git repository

# Environment variables

* **GIT_DIR** path to the git repo
* **GIT_BRANCH** branch to use (optional)
* **GIT_URL** url to clone if the repository does not exist (optional)

# Usage

```bash
docker run \
 -v /my/git/repo:/git \
 -e GIT_DIR=/git \
 -e GIT_BRANCH=master \
 buckaroobanzay/git_autoupdate
```

# Testing / dev

```bash
docker build . -t git_autoupdate
docker run --rm -it -e GIT_DIR=/git -e GIT_URL=https://github.com/BuckarooBanzay/git_autoupdate/ git_autoupdate
```

# License

MIT
