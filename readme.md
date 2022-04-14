# Usage

To import from this git branch to local config (effectively overwriting your config, but you'll be asked if you are sure):

#### `./import.sh`

To export your local config to this branch:

#### `./export.sh`

# Utilities

- [Change Directory Bookmarks (cdb)](#change-directory-bookmarks)
- [Github](#github)

### Change Directory Bookmarks

Create a bookmark:
```bash
cdb -c bookmark
```
Delete a bookmark:
```bash
cdb -d bookmark
```
List bookmarks:
```bash
cdb -l
```
Goto bookmark:
```bash
cdb [-g] bookmark
```

### Github

To push everything in a lazy way:
```bash
lazygit commitMessage
```

#### <span style="color:red;">TODO</span>
To make a new git repo via github's api:
```
git-create-repo repoName
```