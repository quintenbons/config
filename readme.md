# Usage

To import from this git branch to local config (effectively overwriting your config, but you'll be asked if you are sure):

#### `./import.sh`

To export your local config to this branch:

#### `./export.sh`

# Utilities

- [Change Directory Bookmarks (cdb)](#change-directory-bookmarks)

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