return {
  "nvim-lualine/lualine.nvim",
  -- dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = false,
        theme = "catppuccin",
        section_separators = "",
        component_separators = "|",
      },
    })
  end,
}
