return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "css",
        "scss",
        "html",
        "javascript",
        css = { css = true },
        scss = { css = true },
        html = { css = true },
        javascript = { css = true },
      })
    end,
  },
}
