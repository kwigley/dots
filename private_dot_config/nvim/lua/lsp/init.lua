local lsp = require 'lspconfig'
local util = require 'lspconfig/util'
local lspfuzzy = require 'lspfuzzy'

-- Your custom attach function for nvim-lspconfig goes here.
local on_attach = function(client, bufnr)
    require'completion'.on_attach(client, bufnr)

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    --buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    --buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    --buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    --buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    --buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

end

-- rust lsp
lsp.rust_analyzer.setup {
  on_attach = on_attach
}
-- python lsp
lsp.pyright.setup {
  on_attach = on_attach,
}
-- docker lsp
lsp.dockerls.setup {
  on_attach = on_attach,
}
-- sumneko_lua lsp
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local sumneko_root_path = vim.fn.stdpath('cache')..'/nlua/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
local root_dir = function(fname)
    return util.find_git_ancestor(fname) or util.path.dirname(fname)
end
lsp.sumneko_lua.setup {
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  on_attach = on_attach,
  root_dir = root_dir,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}
-- nlua lsp
-- require('nlua.lsp.nvim').setup(lsp, {
    -- on_attach = on_attach,
-- })
-- json lsp
lsp.jsonls.setup {
  on_attach = on_attach,
}
-- yaml lsp
lsp.yamlls.setup {
    on_attach = on_attach,
}
-- typescript lsp
-- lsp.tsserver.setup {
    -- on_attach = on_attach,
-- }
lsp.rome.setup {
    on_attach = on_attach,
}
-- vim lsp
lsp.vimls.setup {
    on_attach = on_attach,
}
-- diagnostic lsp
-- lsp.diagnosticls.setup {
--    on_attach = on_attach,
-- }
-- Make the LSP client use FZF instead of the quickfix list
lspfuzzy.setup {}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)


