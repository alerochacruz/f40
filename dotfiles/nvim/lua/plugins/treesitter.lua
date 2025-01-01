return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        -- autotag = { enable = true },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      local config = require("nvim-treesitter")
      config.setup({
        autotag = { enable = true },
      })
      require("nvim-ts-autotag").setup()
    end,
  },
}
