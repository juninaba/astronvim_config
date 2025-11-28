return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          grep = {
            regex = false, -- use fixed strings by default (adds rg --fixed-strings)
          },
        },
      },
    },
  },
}
