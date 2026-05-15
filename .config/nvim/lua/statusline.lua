local M = {}

-- Highlight Palette
function M.setup_hl()
  local hl = vim.api.nvim_set_hl

  -- Base statusline (Transparent bg to blend with Terminal/Zellij)
  hl(0, "StatusLine", { fg = '#c0caf5', bg = "none" })
  hl(0, "StatusLineNC", { fg = '#565f89', bg = "none" })

  local colors = {
    Orange = '#ff9e64',
    Blue = '#7aa2f7',
    Purple = '#bb9af7',
    Cyan = '#73daca',
    Red = '#f7768e',
    Yellow = '#e0af68',
    Green = '#9ece6a',
    Teal = '#2ac3de',
    Fg = '#c0caf5',
  }

  for name, col in pairs(colors) do
    hl(0, "SK" .. name, { fg = col, bg = "none" })
    hl(0, "SK" .. name .. "Bold", { fg = col, bg = "none", bold = true })
  end
end

-- Highlight helper (SK prefix for SKStatusLine color group)
function M.hl(group, text)
  if not text or text == "" then return "" end
  return string.format("%%#SK%s#%s%%*", group, text)
end

-- local function get_git()
--   local branch = vim.b.gitsigns_head or ""
--   return branch ~= "" and M.hl("Orange", " " .. branch) or ""
-- end

local function get_lsp()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then return "" end
  return M.hl("TealBold", " " .. clients[1].name)
end

-- Components
local function get_size()
  local name = vim.api.nvim_buf_get_name(0)
  if name == "" then return "" end
  local size = vim.fn.getfsize(name)
  if size <= 0 then return "" end

  local units = { "B", "KB", "MB", "GB" }
  local unit = 1
  while size >= 1024 and unit < #units do
    size = size / 1024
    unit = unit + 1
  end
  return M.hl("Blue", string.format("[%.1f%s]", size, units[unit]))
end

M.external_left = {}
M.external_right = {}

function M.render()
  -- LEFT: Project & File Info
  local left = {
    -- get_git(),
    M.hl("Fg", "󰈙 %f"), -- %f is relative path
    M.hl("Red", "%m%r"), -- Modified/Read-only flags
    vim.diagnostic.status(),
    vim.ui.progress_status()
  }
  for _, func in pairs(M.external_left) do
    local val = func()
    if val and val ~= "" then table.insert(left, 1, val) end -- Insert at start for Git
  end

  -- RIGHT: Metadata & Location
  local right = {
    get_lsp(),
    vim.lsp.status(),
    M.hl("Yellow", "%y"), -- Filetype
    get_size(),
    M.hl("Purple", "%l:%c"),
    M.hl("Cyan", "%P"), -- Percentage
  }

  -- Helper to filter empty strings and join
  local function combine(list)
    local out = {}
    for _, item in ipairs(list) do
      if item and item ~= "" then table.insert(out, item) end
    end
    return table.concat(out, "  ") -- Use double space for breathing room
  end

  for _, func in pairs(M.external_right) do
    local val = func()
    if val and val ~= "" then table.insert(right, val) end
  end

  return combine(left) .. " %=" .. combine(right)
end

-- 5. Setup
function M.setup()
  M.setup_hl()

  -- Create global bridge for the statusline string
  _G.CoreStatusline = M.render
  vim.g.qf_disable_statusline = 1 -- Disable built-in quickfix statusline
  vim.opt.statusline = "%!v:lua.CoreStatusline()"

  -- Refresh more frequently for diagnostics and mode changes
  local group = vim.api.nvim_create_augroup("StatuslineRefresh", { clear = true })
  vim.api.nvim_create_autocmd({ "BufEnter", "ModeChanged", "DiagnosticChanged", "LspAttach" }, {
    group = group,
    callback = function() vim.cmd("redrawstatus") end,
  })
end

return M
