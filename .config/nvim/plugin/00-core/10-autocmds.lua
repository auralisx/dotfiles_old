local function augroup(name)
  return vim.api.nvim_create_augroup("SK_" .. name, { clear = true })
end

-- BUFFER & FILE BEHAVIOR
local file_group = augroup("file_behavior")

-- Autosave on specific events (Zed-style)
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertLeave" }, {
  group = file_group,
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      vim.cmd("silent! update")
    end
  end,
  desc = "Autosave on focus change or exiting insert mode",
})

-- Return to last edit position
vim.api.nvim_create_autocmd("BufReadPost", {
  group = file_group,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto-create parent directories
vim.api.nvim_create_autocmd("BufWritePre", {
  group = file_group,
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then return end
    local file = vim.uv.fs_realpath(event.match) or event.match
    local dir = vim.fn.fnamemodify(file, ":p:h")
    vim.fn.mkdir(dir, "p")
  end,
})

-- UI & APPEARANCE
local ui_group = augroup("ui_tweaks")

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = ui_group,
  callback = function() vim.highlight.on_yank({ timeout = 200 }) end,
})

-- Resize splits evenly on terminal resize
vim.api.nvim_create_autocmd("VimResized", {
  group = ui_group,
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Dynamic Relative Numbers (Zed-style)
-- Shows relative numbers in normal mode, absolute in insert/unfocused
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  group = ui_group,
  callback = function()
    if vim.wo.number and vim.api.nvim_get_mode().mode ~= "i" then
      vim.wo.relativenumber = true
    end
  end,
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
  group = ui_group,
  callback = function()
    if vim.wo.number then
      vim.wo.relativenumber = false
    end
  end,
})

-- TERMINAL & SPECIAL BUFFERS
local special_group = augroup("special_buffers")

-- Better Terminal defaults
vim.api.nvim_create_autocmd("TermOpen", {
  group = special_group,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert") -- Auto-enter insert mode
  end,
})

-- Auto-close Neovim if only special windows are left (Netrw, Quickfix, Help)
vim.api.nvim_create_autocmd("BufEnter", {
  group = special_group,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 then
      local ft = vim.bo.filetype
      local bt = vim.bo.buftype
      if ft == "netrw" or ft == "help" or bt == "quickfix" then
        vim.cmd("quit")
      end
    end
  end,
})

-- LANGUAGE SPECIFIC (FileType)
local lang_group = augroup("language_settings")

-- Disable diagnostics in node_modules
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = lang_group,
  pattern = "*/node_modules/*",
  callback = function()
    vim.diagnostic.enable(false, { bufnr = 0 })
  end,
})
