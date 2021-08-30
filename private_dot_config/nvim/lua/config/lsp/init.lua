local util = require("util")

require("config.lsp.diagnostics")
require("config.lsp.kind").setup()

local function on_attach(client, bufnr)
  require("config.lsp.formatting").setup(client, bufnr)
  require("config.lsp.keys").setup(client, bufnr)
  require("config.lsp.highlighting").setup(client)

  -- TypeScript specific stuff
  if client.name == "typescript" or client.name == "tsserver" then
    require("config.lsp.ts-utils").setup(client)
  end
end

-- TODO move this to a util package
local path_sep = "/"
local cache_dir = os.getenv("HOME")
  .. path_sep
  .. ".cache"
  .. path_sep
  .. "nvim"
  .. path_sep

local servers = {
  pyright = {},
  bashls = {},
  dockerls = {},
  tsserver = {},
  cssls = { cmd = { "css-languageserver", "--stdio" } },
  rnix = {},
  jsonls = { cmd = { "vscode-json-languageserver", "--stdio" } },
  html = { cmd = { "html-languageserver", "--stdio" } },
  clangd = {},
  gopls = {},
  ["null-ls"] = {},
  sumneko_lua = require("lua-dev").setup({
    lspconfig = {
      cmd = {
        cache_dir .. "lua-language-server/bin/macOS/lua-language-server",
        "-E",
        cache_dir .. "lua-language-server/main.lua",
      },
    },
  }),
  vimls = {},
  terraformls = {},
  yamlls = {},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

require("config.lsp.null-ls").setup()

local server_opts = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

require("rust-tools").setup({ server = server_opts })

local lspconfig = require("lspconfig")
for server, config in pairs(servers) do
  lspconfig[server].setup(vim.tbl_deep_extend("force", server_opts, config))
  local cfg = lspconfig[server]
  if not (cfg and cfg.cmd and vim.fn.executable(cfg.cmd[1]) == 1) then
    util.error(server .. ": cmd not found: " .. vim.inspect(cfg.cmd))
  end
end
