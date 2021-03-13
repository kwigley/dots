local M = {}
local vim,api = vim,vim.api
local new_opts = {}

local get_default_options = function()
  local default_opts={
    indent_levels = 30;
    indent_guide_size = 1;
    indent_start_level = 1;
    --FIXME:
    indent_pretty_mode = false;
    indent_space_guides = true;
    indent_tab_guides = false;
    indent_soft_pattern = '\\s';
    exclude_filetypes = {'help','dashboard','dashpreview','NvimTree','vista','sagahover','sagasignature','packer','log','lspsagafinder','lspinfo'};
    even_colors = { fg = '#23272e',bg = '#23272e' };
    odd_colors = { fg = '#23272e',bg = '#23272e' };
  }
  return default_opts
end

local win_indent_matches = {}

local function get_indent_namespace()
  return api.nvim_create_namespace('indent_guides_neovim')
end

local indent_clear_matches = function()
  local current_winid = api.nvim_get_current_win()
  if win_indent_matches[current_winid] then
    for _,match_id in pairs(win_indent_matches[current_winid]) do
      vim.fn.matchdelete(match_id,current_winid)
    nd
    win_indent_matches[current_winid] = {}
  end
  local indent_namespace = get_indent_namespace()
  api.nvim_buf_clear_namespace(0,indent_namespace,0,-1)
end

local indent_highlight_color =function ()
  local even = new_opts.even_colors
  local odd = new_opts.odd_colors

  api.nvim_command('hi IndentGuidesEven guifg=' .. even['fg'] .. ' guibg='.. even['bg'])
  api.nvim_command('hi IndentGuidesEvenVirtext guifg=' .. even['bg'] .. ' guibg='.. even['fg'])
  api.nvim_command('hi IndentGuidesOdd guifg=' .. odd['fg'] .. ' guibg='.. odd['bg'])
  api.nvim_command('hi IndentGuidesOddVirtext guifg=' .. odd['bg'] .. ' guibg='.. odd['fg'])
end

local indent_highlight_pattern= function(indent_pattern,column_start,indent_size)
  local pattern = '^'
  pattern = pattern .. indent_pattern .. '*\\%' .. column_start .. 'v\\zs'
  pattern = pattern .. indent_pattern .. '*\\%' .. (column_start + indent_size) .. 'v'
  pattern = pattern .. '\\ze'
  return pattern
end

local get_indent_size = function ()
  local indent_size = 0
  if vim.bo.shiftwidth > 0 and vim.bo.expandtab then
    indent_size = vim.bo.shiftwidth
  else
    indent_size = vim.bo.tabstop
  end
  return indent_size
end

local render_indent_guides = function()
  local indent_size = get_indent_size()
  local guide_size = new_opts['indent_guide_size']
  if guide_size == 0 or guide_size > indent_size then
    guide_size = indent_size
  end

  local level_tbl = vim.fn.range(new_opts['indent_start_level'],new_opts['indent_levels'])
  for _,level in pairs(level_tbl) do
    local group = 'IndentGuides'
    if level % 2 == 0 then
      group = group .. 'Even'
    else
      group = group .. 'Odd'
    end
    local column_start = (level -1 ) * indent_size + 1

    coroutine.yield(group,column_start,guide_size,indent_size)
  end
end

local uv = vim.loop
local keyword = {
  ['for'] = true,['if'] = true,['while'] = true,
  [';'] = true
}

function M.render_blank_line()
  local indent_size = get_indent_size()
  local indent_namespace = get_indent_namespace()

  local async_render_blank
  async_render_blank = uv.new_async(vim.schedule_wrap(function ()
    if vim.fn.index(new_opts.exclude_filetypes,vim.bo.filetype) ~= -1 then
      return
    end
    local lines = api.nvim_buf_get_lines(0,0,-1,false)
    local prev_line_guides = {}
    for key,text in ipairs(lines) do
      local idt = vim.fn.cindent(key)
      if #text == 0 and idt > 0 then
        local tbl = vim.fn.range(math.floor(idt / indent_size))
        local guides = {}
        if #lines[key - 1] == 0 then
          guides = prev_line_guides
        else
          for k,level in pairs(tbl) do
            if level % 2 == 0 then
              guides[#guides+1] = {' ','IndentGuidesEvenVirtext'}
            else
              guides[#guides+1] = {' ','IndentGuidesOddVirtext'}
            end
            if #tbl > 1 then
              for i=1,indent_size -1 , 1 do
                guides[#guides+1] = {' ',''}
              end
            end
            local fist_char = lines[key-1]:match('%S+')
            local last_char = lines[key-1]:sub(#lines[key-1],-1)
            if keyword[fist_char] and not keyword[last_char] and k == #tbl then
              if #tbl == 1 then
                guides[#guides+1] = {' ',''}
              end
              if guides[#guides - 1][2]  == 'IndentGuidesEvenVirtext' then
                guides[#guides+1] = {' ','IndentGuidesOddVirtext'}
              else
                guides[#guides+1] = {' ','IndentGuidesEvenVirtext'}
              end
            end
          end
          prev_line_guides = guides
        end
        api.nvim_buf_set_extmark(0,indent_namespace,key - 1,0,{
          virt_text = guides,
          virt_text_pos = 'overlay'
        })
      end
    end
    async_render_blank:close()
  end))
  async_render_blank:send()
end

local indent_guides_enable = function()
  if vim.fn.index(new_opts.exclude_filetypes,vim.bo.filetype) ~= -1 then
    indent_clear_matches()
    return
  end

  local current_winid = api.nvim_get_current_win()
  win_indent_matches[current_winid] = win_indent_matches[current_winid] or {}

  indent_highlight_color()
  indent_clear_matches()

  local indent_guides = coroutine.create(render_indent_guides)
  local indent_render = function()
    while true do
      local _,group,column_start,guide_size,indent_size = coroutine.resume(indent_guides)
      if column_start ~= nil then
        if new_opts['indent_space_guides'] then
          local soft_pattern = indent_highlight_pattern(new_opts['indent_soft_pattern'],column_start,guide_size)
          local id = vim.fn.matchadd(group,soft_pattern)
          table.insert(win_indent_matches[current_winid],id)
        end
        if new_opts['indent_tab_guides'] then
          local hard_pattern = indent_highlight_pattern('\\t',column_start,indent_size)
          table.insert(win_indent_matches[current_winid],vim.fn.matchadd(group,hard_pattern))
        end
      end
      if coroutine.status(indent_guides) == 'dead' then
        break
      end
    end
  end

  indent_render()
  if new_opts.indent_pretty_mode then
    M.render_blank_line()
  end
end

local indent_enabled = true

function M.indent_guides_enable()
  if next(new_opts) == nil then
    new_opts = get_default_options()
  end
  indent_guides_enable()
  if not indent_enabled then
    M.indent_guides_augroup()
  end
end

function M.indent_guides_disable()
  indent_enabled = false
  for winid,matches in pairs(win_indent_matches) do
    for _,id in ipairs(matches) do
      vim.fn.matchdelete(id,winid)
    end
  end
  win_indent_matches = {}
  api.nvim_command('augroup indent_guides_nvim')
  api.nvim_command('autocmd!')
  api.nvim_command('augroup END')
end

function M.indent_guides_toggle()
  if indent_enabled then
    M.indent_guides_disable()
  else
    indent_enabled = true
    M.indent_guides_enable()
  end
end

function M.setup(user_opts)
  local opts = user_opts or {}
  new_opts = vim.tbl_extend('force',get_default_options(),opts)
end

function M.get_indent_matches()
  print(vim.inspect(win_indent_matches))
end

function  M.indent_guides_augroup()
  api.nvim_command('augroup indent_guides_nvim')
  api.nvim_command('autocmd!')
  api.nvim_command('autocmd WinEnter,BufEnter,FileType * lua vim.schedule(require("indent_guides").indent_guides_enable)')
  if new_opts.indent_pretty_mode then
    api.nvim_command('autocmd TextChanged,TextChangedI * lua require("indent_guides").render_blank_line()')
  end
  api.nvim_command('augroup END')
end

return M
