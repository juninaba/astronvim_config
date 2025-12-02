return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      options = {
        opt = {
          number = false,
          relativenumber = false,
          wrap = true,
          linebreak = true,
          breakindent = true,
        },
      },
      mappings = {
        n = {
          ["<C-a>"] = { "^", desc = "" },
          ["<C-e>"] = { "$", desc = "" },
          ["<Leader>ss"] = { "<cmd>split<cr>", desc = "Horizontal Split" },
          ["<Leader>sv"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" },
          ["<Leader>sh"] = { "<c-\\><c-n><c-w>h", desc = "Terminal left window navigation" },
          ["<Leader>sj"] = { "<c-\\><c-n><c-w>j", desc = "Terminal down window navigation" },
          ["<Leader>sk"] = { "<c-\\><c-n><c-w>k", desc = "Terminal up window navigation" },
          ["<Leader>sl"] = { "<c-\\><c-n><c-w>l", desc = "Terminal right window navigation" },

          -- terminal
          ["<C-f>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle floating terminal" },
          ["<C-v>"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Toggle vertical terminal" },

          -- resize
          ["<A-h>"] = { ":vertical resize +2<CR>" },
          ["<A-l>"] = { ":vertical resize -2<CR>" },
          -- ["<A-j>"] = { ":resize -2<CR>" },
          -- ["<A-k>"] = { ":resize +2<CR>" },

          L = {
            function() require("astrocore.buffer").nav(vim.v.count1) end,
            desc = "Next buffer",
          },
          H = {
            function() require("astrocore.buffer").nav(-vim.v.count1) end,
            desc = "Previous buffer",
          },
        },
        t = {
          ["<C-f>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "toggle floating terminal" },
          ["<C-v>"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "toggle vertical terminal" },
        },
      },
    },
  },
}
