Config.now_if_args(function()
  vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/mason-org/mason-lspconfig.nvim',
    'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  })
  require("mason").setup()
  require("mason-lspconfig").setup()
  require('mason-tool-installer').setup({
    ensure_installed = {
      "lua_ls",
      "stylua",
    }
  })
end)

Config.later(function()
  vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })

  require('conform').setup({
    default_format_opts = {
      -- Allow formatting from LSP server if no dedicated formatter is available
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      rust = { "rustfmt" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      json = { "prettierd" },
      sql = { "sql_formatter" },
    },
  })

  vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  -- Format on save
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("Conform", { clear = true }),
    pattern = "*",
    callback = function(args)
      require("conform").format({ bufnr = args.buf })
    end,
  })
end)
