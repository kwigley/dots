local cmp = require("cmp")
local luasnip = require("luasnip")

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(t("<C-n>"), "n")
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
      elseif check_back_space() then
        vim.fn.feedkeys(t("<Tab>"), "n")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(t("<C-p>"), "n")
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  format = function(entry, vim_item)
    print(vim.inspect(entry))
    print(vim.inspect(vim_item))
    return vim_item
  end,
  sources = {
    { name = "buffer" },
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "nvim_lua" },
    { name = "calc" },
    { name = "emoji" },
    { name = "spell" },
  },
})

require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
  auto_select = true, -- automatically select the first item
})
