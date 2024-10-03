return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts= {},
    config = function()
      require("ibl").setup({
        scope = { enabled = false },
        -- scope = { show_start = false },
        indent = { char = '¦' },
      })
    end
  }
}
