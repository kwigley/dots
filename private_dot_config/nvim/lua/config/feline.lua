local M = {}

function M.load()
	local tokyonight_colors = require("tokyonight.colors").setup()
	local colors = require("feline.defaults").colors
	local overrides = {
		fg = tokyonight_colors.fg,
		bg = tokyonight_colors.bg_statusline,
		black = tokyonight_colors.black,
		skyblue = tokyonight_colors.blue,
		cyan = tokyonight_colors.cyan,
		green = tokyonight_colors.green,
		oceanblue = tokyonight_colors.blue0,
		magenta = tokyonight_colors.magenta,
		orange = tokyonight_colors.orange,
		red = tokyonight_colors.red,
		violet = tokyonight_colors.purple,
		white = tokyonight_colors.fg,
		yellow = tokyonight_colors.yellow,
	}
	for k, v in pairs(overrides) do
		colors[k] = v
	end
	require("feline").setup({
		colors = colors,
	})
end

M.load()

return M
