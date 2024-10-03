return {
  {
    -- Completion source for nvim-cmp
    -- that displays the built-in LSP completions
    -- offered by whathever LSP is attached to the buffer
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    -- Snippet Engine
    -- Source for snippets and snippet expansion tool for nvim-cmp
    "L3MON4D3/LuaSnip",
    dependencies = {
      -- Completion source for LuaSnip
      "saadparwaiz1/cmp_luasnip",
      -- Collection of VS Code-like snippets
      -- that can be loaded by LuaSnip
      "rafamadriz/friendly-snippets",
    },
  },
  {
    -- Completion Engine Plugin
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      -- NEW
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end
      local luasnip = require("luasnip")
      -- END NEW

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          -- Specify a Snippet Engine
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),

          -- NEW
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
              -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
              -- that way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          -- END NEW
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
          { name = "emmet_vim" }, -- Add this line to include the Emmet completion source
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
