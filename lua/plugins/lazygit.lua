--          ╔═════════════════════════════════════════════════════════╗
--          ║                      lazygit.nvim                       ║
--          ╚═════════════════════════════════════════════════════════╝

--          ┌─────────────────────────────────────────────────────────┐
--          │   lazygit.nvim integrates the Lazygit terminal UI for   │
--          │                  Git into the editor.                   │
--          └─────────────────────────────────────────────────────────┘


return {
    "kdheepak/lazygit.nvim",
    
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    event = "VeryLazy", -- Load only when needed for git operations
    dependencies = { "nvim-lua/plenary.nvim" }, -- Use Plenary for floating window handling
    keys = { -- Keybindings defined here
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    },
    config = function()
        -- You can add any additional configuration or keybindings here if needed
        -- But you don't need a `setup()` call for lazygit.nvim
    end,
}

