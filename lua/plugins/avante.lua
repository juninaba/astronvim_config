local function tokens(num)
  return num * 1024
end

return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- Never set this value to "*"! Never!
    opts = {
      provider = "copilot",
      -- auto_suggestions_provider = "copilot",
      copilot = {
        endpoint = "https://api.githubcopilot.com",
        model = "gemini-2.5-pro",
        timeout = 30000,
        temperature = 0,
        max_tokens = tokens(256),
      },
      vendors = {
        ["copilot:3.7-thought"] = {
          __inherited_from = "copilot",
          model = "claude-3.7-sonnet-thought",
          max_tokens = tokens(64),
        },
        ["copilot:3.7"] = {
          __inherited_from = "copilot",
          model = "claude-3.7-sonnet",
          max_tokens = tokens(64),
        },
        ["copilot:o3-mini"] = {
          __inherited_from = "copilot",
          model = "o3-mini",
          max_tokens = tokens(64),
        },
        ["copilot:o4-mini"] = {
          __inherited_from = "copilot",
          model = "o4-mini",
          max_tokens = tokens(64),
        },
        ["copilot:gpt-4.1"] = {
          __inherited_from = "copilot",
          model = "gpt-4.1",
          max_tokens = tokens(256),
        },
      },
      ag_service = { enabled = false },
      behaviour = {
        use_cwd_as_project_root = true,
        -- auto_apply_diff_after_generation = true,
      },
      windows = {
        ---@type "right" | "left" | "top" | "bottom"
        position = "left",
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  } 
}
