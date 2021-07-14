require("bufferline").setup({
  options = {
    mappings = true,
    diagnostics = "nvim_lsp",
    offsets = {{filetype = "NvimTree"}},
    diagnostics_indicator = function(_, _, diagnostics_dict)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. sym .. n
      end
      return s
    end,
  },
})
