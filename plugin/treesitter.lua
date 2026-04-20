-- Register the "procman" tree-sitter parser so that :TSInstall procman works.
-- This must run before :TSInstall is invoked. When using lazy.nvim, ensure this
-- plugin is NOT lazy-loaded by filetype alone (see README for the recommended
-- spec).

-- Always register the parser<->filetype mapping with Neovim core (available
-- since Neovim 0.9). This lets Neovim know that .pman files should use the
-- "procman" tree-sitter parser, independent of nvim-treesitter.
vim.treesitter.language.register("procman", "pman")

-- Register with nvim-treesitter so :TSInstall procman knows where to fetch
-- the grammar from.
local ok, parsers = pcall(require, "nvim-treesitter.parsers")
if ok and not parsers.procman then
  parsers.procman = {
    install_info = {
      url = "https://github.com/wbbradley/tree-sitter-procman",
      branch = "main",
    },
  }
end
