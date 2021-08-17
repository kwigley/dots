require("gitlinker").setup({
  opts = {
    action_callback = require("gitlinker.actions").open_in_browser,
    print_url = false,
  },
})

vim.api.nvim_set_keymap(
  "n",
  "<leader>gY",
  '<cmd>lua require"gitlinker".get_repo_url()<cr>',
  { silent = true }
)
