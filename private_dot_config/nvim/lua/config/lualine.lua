local function lsp_progress()
	local messages = vim.lsp.util.get_progress_messages()
	if #messages == 0 then
		return
	end
	local status = {}
	for _, msg in pairs(messages) do
		table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
	end
	local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
	local ms = vim.loop.hrtime() / 1000000
	local frame = math.floor(ms / 120) % #spinners
	return table.concat(status, " | ") .. " " .. spinners[frame + 1]
end

vim.cmd([[autocmd User LspProgressUpdate let &ro = &ro]])

local config = {
	options = {
		theme = "tokyonight",
		icons_enabled = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { { "diagnostics", sources = { "nvim_lsp" } }, { "filename", path = 1 } },
		lualine_x = { "filetype", lsp_progress },
	},
	extensions = { "nvim-tree", "quickfix" },
}

-- try to load matching lualine theme

local M = {}

function M.load()
	local name = vim.g.colors_name or ""
	local ok, _ = pcall(require, "lualine.themes." .. name)
	if ok then
		config.options.theme = name
	end
	require("lualine").setup(config)
end

M.load()

return M
