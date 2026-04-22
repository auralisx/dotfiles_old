Config.later(function()
  vim.pack.add({
    'https://github.com/nvim-mini/mini.ai',
    'https://github.com/nvim-mini/mini.pairs',
    'https://github.com/nvim-mini/mini.surround',
    'https://github.com/nvim-mini/mini.operators',
    'https://github.com/nvim-mini/mini.align',
    'https://github.com/folke/ts-comments.nvim',
    'https://github.com/folke/flash.nvim',
    'https://github.com/folke/todo-comments.nvim',
  })
  require('mini.ai').setup()
  require('mini.pairs').setup()
  require('mini.surround').setup({
    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
      add = 'ys',        -- Add surrounding in Normal and Visual modes
      delete = 'ds',     -- Delete surrounding
      find = 'gfs',      -- Find surrounding (to the right)
      find_left = 'gsF', -- Find surrounding (to the left)
      highlight = 'gsh', -- Highlight surrounding
      replace = 'cs',    -- Replace surrounding

      suffix_last = 'l', -- Suffix to search with "prev" method
      suffix_next = 'n', -- Suffix to search with "next" method
    },
  })
  require('mini.operators').setup()
  require('mini.align').setup()
  require('ts-comments').setup()

  -- Flash
  vim.keymap.set({ 'n', 'x', 'o' }, 's', function() require("flash").jump() end, { desc = "Flash" })
  vim.keymap.set({ 'n', 'x', 'o' }, 'S', function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
  vim.keymap.set('o', 'r', function() require("flash").remote() end, { desc = "Remote Flash" })
  vim.keymap.set({ 'o', 'x' }, 'R', function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
  vim.keymap.set({ 'c' }, '<c-s>', function() require("flash").toggle() end, { desc = "Toggle Flash Search" })
  vim.keymap.set({ 'n', 'x', 'o' }, '<c-space>', function()
    require("flash").treesitter()({
      actions = {
        ["<c-space>"] = "next",
        ["<BS>"] = "prev"
      }
    })
  end, { desc = "Treesitter Incremental Selection" })

  -- TODO Comments
  vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
  end, { desc = "Next todo comment" })

  vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
  end, { desc = "Previous todo comment" })
end)
