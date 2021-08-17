require("toggleterm").setup({
  size = 20,
  open_mapping = [[<M-`>]],
  shade_filetypes = {},
  shade_terminals = false,
  shading_factor = 0.3, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  persist_size = true,
  direction = "horizontal",
})
