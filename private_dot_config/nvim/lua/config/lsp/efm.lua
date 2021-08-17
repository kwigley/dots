local M = {}

local fish = { formatCommand = "fish_indent", formatStdin = true }

M.config = {
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = { "package.json", ".git" },
    languages = {
      fish = { fish },
    },
  },
}

M.config.filetypes = {}
for ft, _ in pairs(M.config.settings.languages) do
  table.insert(M.config.filetypes, ft)
end

M.formatted_languages = {}

for lang, tools in pairs(M.config.settings.languages) do
  for _, tool in pairs(tools) do
    if tool.formatCommand then
      M.formatted_languages[lang] = true
    end
  end
end

return M
