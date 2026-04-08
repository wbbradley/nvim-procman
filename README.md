# nvim-procman

Neovim plugin for [procman](https://github.com/wbbradley/procman) `.pman` files.

## Features

- Syntax highlighting (Vim regex and tree-sitter)
- Indentation
- Filetype detection (`*.pman`)

## Compatibility

This plugin targets **procman v0.23.1**.

When bumping support for a newer procman version, check the
[CHANGELOG](https://github.com/wbbradley/procman/blob/main/CHANGELOG.md) from
v0.23.1 onward for syntax/keyword changes.

## Syncing tree-sitter queries

The files in `queries/procman/` are copies of the query files from
[tree-sitter-procman](https://github.com/wbbradley/tree-sitter-procman). After
updating tree-sitter-procman's queries, sync them here:

```sh
./scripts/sync-queries.sh
```

This assumes `tree-sitter-procman` is checked out as a sibling directory.

## Install

Use your preferred plugin manager. For example, with
[lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{ "wbbradley/nvim-procman", ft = "pman" }
```
