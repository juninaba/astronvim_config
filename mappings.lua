-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["sv"] = { "<cmd>vertical split<cr>", desc = "Vertical split" },
    ["ss"] = { "<cmd>horizontal split<cr>", desc = "Horizontal split" },
    [".."] = { "$", desc = "" },
    [",,"] = { "0", desc = "" },

    -- delete
    ["dd"] = { '"_dd', desc = "" },
    ["diw"] = { '"_diw', desc = "" },

    -- terminal
    ["<TAB>i"] = { "<cmd>ToggleTerm direction=float<CR>", desc = "ToggleTerm float" },

    -- hop
    ["e"] = { ":HopChar2<CR>", desc = "" },
    ["<C-a>"] = { ":HopWord<CR>", desc = "" },
    ["<C-n>"] = { ":HopLine<CR>", desc = "" },
    ["<C-p>"] = { ":HopPattern<CR>", desc = "" },

    -- Neogit 
    ["<leader>ng"] = { ":Neogit<CR>", desc = "Neogit, git add, commit, log..." },

    -- number
    ["<leader>N"] = { name = "Number" },
    ["<leader>Ns"] = {  ":set number<CR>", desc = "show number"  },
    ["<leader>Nh"] = {  ":set nonumber<CR>", desc = "hide number"  },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,

    -- terminal
    ["<TAB>i"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
  },
  i = {
    -- copilot
    -- ["<C-g>"] = { 'copilot#Accept("<CR>")', silent = true, expr = true, replace_keycodes = false },
    -- ["<C-]>"] = { 'copilot#Next()', silent = true, expr = true },
    -- ["<C-[>"] = { 'copilot#Previous()', silent = true, expr = true },
    -- ["<C-o>"] = { 'copilot#Dismiss()', silent = true, expr = true },
  },
  v = {
    ["d"] = { '"_d', desc = "" },
  },
}
