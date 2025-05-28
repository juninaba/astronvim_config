return {
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
      require("claude-code").setup({
        window = {
          split_ratio = 0.4,      -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
          position = "vertical",  -- Position of the window: "botright", "topleft", "vertical", "rightbelow vsplit", etc.
        },
        command = "/Users/inabajunichi/.claude/local/claude",
        git = {
          use_git_root = false,     -- Set CWD to git root when opening Claude Code (if in git project)
        },
      })
    end
  } 
}
