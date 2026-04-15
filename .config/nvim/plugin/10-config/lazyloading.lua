vim.schedule(function()
  vim.pack.add({
    'https://github.com/nvim-mini/mini.cmdline',
    'https://github.com/nvim-mini/mini.completion',
  })
end)

vim.api.nvim_create_autocmd('CmdlineEnter', {
  once = true,
  callback = function()
    vim.pack.add({ 'https://github.com/nvim-mini/mini.cmdline' })
    require('mini.cmdline').setup()
  end
})

vim.api.nvim_create_autocmd('InsertEnter', {
  once = true,
  callback = function()
    vim.pack.add({ 'https://github.com/nvim-mini/mini.completion' })
    require('mini.completion').setup()
  end
})

vim.pack.add({ 'https://github.com/nvim-mini/mini.misc' })
local misc = require('mini.misc')
local later = function(f) misc.safely('later', f) end
local on_event = function(ev, f) misc.safely('event:' .. ev, f) end

later(function()
  vim.pack.add({ 'https://github.com/nvim-mini/mini.cmdline' })
  require('mini.cmdline').setup()
end)

on_event('InsertEnter', function()
  vim.pack.add({ 'https://github.com/nvim-mini/mini.completion' })
  require('mini.completion').setup()
end)
