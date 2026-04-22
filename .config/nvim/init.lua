vim.loader.enable()

local g = vim.g

-- Indicate that a Nerd Font is available (used by plugins for icons)
g.have_nerd_font = true

-- Disable unused language providers to improve startup performance
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- Disable aggressive default Markdown syntax rules
g.markdown_recommended_style = 0

local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "tutor",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "logipat",
  "rrhelper",
  "rplugin",
  "spellfile_plugin",
  "matchit",
}

for _, plugin in ipairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

-- Entry point for Neovim configuration.
-- Core keymap loader. define <leader> and <localleader> keys
g.mapleader = vim.keycode("<space>")
g.maplocalleader = vim.keycode("\\")

-- Enable the new UI
require('vim._core.ui2').enable({})

_G.Config = {}
vim.pack.add({ 'https://github.com/nvim-mini/mini.misc' })

local misc = require('mini.misc')
Config.now = function(f) misc.safely('now', f) end
Config.later = function(f) misc.safely('later', f) end
Config.now_if_args = vim.fn.argc(-1) > 0 and Config.now or Config.later
Config.on_event = function(ev, f) misc.safely('event:' .. ev, f) end
Config.on_filetype = function(ft, f) misc.safely('filetype:' .. ft, f) end
