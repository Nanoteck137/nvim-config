local luasnip = require 'luasnip'

local s = luasnip.snippet
local fmt = require("luasnip.extras.fmt").fmt

-- stylua: ignore
luasnip.add_snippets("toml", {
  s("rust", fmt([[
  unstable_features = true
  max_width = 79
  reorder_imports = true
  binop_separator = "Back"
  format_strings = true
  hex_literal_case = "Lower"
  imports_granularity = "Module"
  group_imports = "StdExternalCrate"
  ]], {}))
})
