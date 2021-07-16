local npairs = require("nvim-autopairs")

npairs.setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})

require("nvim-autopairs.completion.compe").setup({
	map_cr = true, --  map <CR> on insert mode
	map_complete = true, -- it will auto insert `(` after select function or method item
	enable_check_bracket_line = true, --if next character is a close pairs and it doesn't have an open pairs in same line then it will not add a close pairs
})
