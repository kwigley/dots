local actions = require("lir.actions")
local mark_actions = require("lir.mark.actions")
local clipboard_actions = require("lir.clipboard.actions")

require("lir").setup({
  show_hidden_files = false,
  devicons_enable = true,
  mappings = {
    ["<CR>"] = actions.edit,
    ["<C-s>"] = actions.split,
    ["<C-v>"] = actions.vsplit,
    ["<C-t>"] = actions.tabedit,

    ["-"] = actions.up,
    ["q"] = actions.quit,

    ["K"] = actions.mkdir,
    ["N"] = actions.newfile,
    ["R"] = actions.rename,
    ["@"] = actions.cd,
    ["Y"] = actions.yank_path,
    ["."] = actions.toggle_show_hidden,
    ["D"] = actions.delete,

    ["J"] = function()
      mark_actions.toggle_mark()
      vim.cmd("normal! j")
    end,
    ["C"] = clipboard_actions.copy,
    ["X"] = clipboard_actions.cut,
    ["P"] = clipboard_actions.paste,
  },
  float = {
    winblend = 10,
  },
  hide_cursor = true,
})

-- custom folder icon
require("nvim-web-devicons").setup({
  override = {
    lir_folder_icon = {
      icon = "",
      color = "#7ebae4",
      name = "LirFolderNode",
    },
  },
})

require("lir.git_status").setup({
  show_ignored = false,
})

-- use visual mode
function _G.LirSettings()
  vim.api.nvim_buf_set_keymap(
    0,
    "x",
    "J",
    ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
    { noremap = true, silent = true }
  )

  -- echo cwd
  vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
end

vim.cmd([[augroup lir-settings]])
vim.cmd([[  autocmd!]])
vim.cmd([[  autocmd Filetype lir :lua LirSettings()]])
vim.cmd([[augroup END]])

vim.api.nvim_set_keymap(
  "n",
  "-",
  [[<Cmd>execute 'e ' .. expand('%:p:h')<CR>]],
  { noremap = true, silent = true }
)
