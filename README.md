# nvim-procman

Neovim plugin for [procman](https://github.com/wbbradley/procman) `.pman` files.

## Features

- Syntax highlighting (Vim regex and tree-sitter)
- Indentation
- Filetype detection (`*.pman`)

## Compatibility

This plugin targets **procman v0.21.0**.

When bumping support for a newer procman version, check the
[CHANGELOG](https://github.com/wbbradley/procman/blob/main/CHANGELOG.md) from
v0.21.0 onward for syntax/keyword changes.

## Install

Use your preferred plugin manager. For example, with
[lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{ "wbbradley/nvim-procman", ft = "pman" }
```
