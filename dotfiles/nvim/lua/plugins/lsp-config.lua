return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",   -- Lua Formatter
          "prettier", -- CSS Formatter
          -- "eslint_d",
          "black",    -- Python Formatter
          "isort",    -- Python Formatter
          -- "beautysh", -- Bash Formatter DEPRECATED 2024-02-24
          "shfmt",    -- Bash Formatter
          -- "rubocop",  -- Ruby Linter/Formatter
          -- "fixjson", -- JSON Fixer/Formatter DEPRECATED 2024-02-24
          "php-cs-fixer",  -- PHP Formatter
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",                -- Lua LSP
          -- DEPRECATED on nvim v0.10.1
          -- "tsserver",              -- JavaScript LSP
          "ts_ls",                 -- JavaScript LSP
          "jedi_language_server",  -- Python LSP
          "intelephense",          -- PHP LSP
          "cssls",                 -- CSS LSP
          "html",                  -- HTML LSP
          "bashls",                -- Bash LSP
          "emmet_language_server", -- Emmet LSP
          "eslint",                -- ESLint LSP
          "jsonls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      -- DEPRECATES on nvim v0.10.1
      -- lspconfig.tsserver.setup({
      --   capabilities = capabilities,
      -- })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.jedi_language_server.setup({
        capabilities = capabilities,
      })
      lspconfig.intelephense.setup({
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })
      lspconfig.emmet_language_server.setup({
        capabilities = capabilities,
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
      })
      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
