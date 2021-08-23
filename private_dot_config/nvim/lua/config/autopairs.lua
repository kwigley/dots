local npairs = require("nvim-autopairs")

npairs.setup({
  disable_filetype = { "TelescopePrompt", "vim", "spectre_panel" },
  check_ts = true,
  fast_wrap = {},
})

require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
})
