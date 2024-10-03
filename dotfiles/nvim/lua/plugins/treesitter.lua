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
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        autotag = { enable = true },
      })
      require("nvim-ts-autotag").setup()
    end,
  },
}
