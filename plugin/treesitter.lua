local ok, parsers = pcall(require, "nvim-treesitter.parsers")
if not ok then
  return
end

local parser_config = parsers.get_parser_configs()
parser_config.procman = {
  install_info = {
    url = "https://github.com/wbbradley/tree-sitter-procman",
    files = { "src/parser.c", "src/scanner.c" },
    branch = "main",
  },
  filetype = "pman",
}
