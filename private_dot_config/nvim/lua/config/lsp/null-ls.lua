local nls = require("null-ls")

local M = {}

function M.setup()
	nls.config({
		debounce = 150,
		save_after_format = false,
		sources = {
			nls.builtins.formatting.prettier.with({
				filetypes = { "css", "html", "json", "yaml", "markdown" },
			}),
			nls.builtins.formatting.prettier_d_slim,
			nls.builtins.formatting.stylua,
			nls.builtins.diagnostics.shellcheck,
			nls.builtins.diagnostics.selene,
		},
	})
end

function M.has_formatter(ft)
	local config = require("null-ls.config")
	local formatters = config.generators("NULL_LS_FORMATTING")
	for _, f in ipairs(formatters) do
		if vim.tbl_contains(f.filetypes, ft) then
			return true
		end
	end
end

return M
