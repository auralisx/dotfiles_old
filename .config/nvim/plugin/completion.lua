Config.now_if_args(function()
  vim.pack.add({
    'https://github.com/saghen/blink.cmp',
  })

  vim.api.nvim_create_autocmd("PackChanged", {
    desc = "Build blink.cmp after install/update",
    group = vim.api.nvim_create_augroup("blink_build", { clear = true }),
    callback = function(ev)
      local name, kind = ev.data.spec.name, ev.data.kind
      if name == "blink.cmp" and (kind == "install" or kind == "update") then
        vim.notify("Building blink.cmp...", vim.log.levels.INFO)
        local obj = vim.system({ "cargo", "build", "--release" }, { cwd = ev.data.path }):wait()
        if obj.code == 0 then
          vim.notify("Building blink.cmp done", vim.log.levels.INFO)
        else
          vim.notify("Building blink.cmp failed", vim.log.levels.ERROR)
        end
      end
    end,
  })
  require("blink.cmp").setup()
end)

Config.later(function()
  vim.pack.add({
    'https://github.com/rafamadriz/friendly-snippets',
  })
end)
