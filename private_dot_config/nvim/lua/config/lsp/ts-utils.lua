return {
  setup = function(client)
    client.resolved_capabilities.document_formatting = false
    local ts = require("nvim-lsp-ts-utils")
    ts.setup({
      disable_commands = false,
      enable_import_on_completion = false,
      import_on_completion_timeout = 5000,
      eslint_bin = "eslint_d",
      eslint_enable_diagnostics = true,
      eslint_enable_disable_comments = true,
    })

    ts.setup_client(client)
  end,
}
