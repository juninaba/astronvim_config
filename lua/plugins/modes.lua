return {
  {
    "mvllow/modes.nvim",
    tag = "v0.2.1",
    config = function()
      require("modes").setup({
        colors = {
          copy = "#DFAB25",
          delete = "#F8747E",
          insert = "#50A4E9",
          visual = "#9A7CD6",
        },
        line_opacity = 0.3,
      })
    end,
  },
}
