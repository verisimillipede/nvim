--          ╔═════════════════════════════════════════════════════════╗
--          ║                     autoclose.nvim                      ║
--          ╚═════════════════════════════════════════════════════════╝

--          ┌─────────────────────────────────────────────────────────┐
--          │ autoclose.nvim provides automatic closing of brackets,  │
--          │          quotes, and other paired characters.           │
--          └─────────────────────────────────────────────────────────┘


return {
    "m4xshen/autoclose.nvim",
    event = { "InsertEnter" },
    config = function()
        require("autoclose").setup({
            keys = {
                ["("]   = { escape = false, close = true, pair = "()" },
                ["["]   = { escape = false, close = true, pair = "[]" },
                ["{"]   = { escape = false, close = true, pair = "{}" },

                [")"]   = { escape = true, close = false, pair = "()" },
                ["]"]   = { escape = true, close = false, pair = "[]" },
                ["}"]   = { escape = true, close = false, pair = "{}" },
                ['"']   = { escape = true, close = true, pair = '""' },
                -- don't mess up my apostrophes
                ["'"]   = { escape = true, close = true, pair = "''", disabled_filetypes = { "text", "markdown", "md" } },
                ["`"]   = { escape = true, close = true, pair = "``", disabled_filetypes = { "text", "markdown", "md" } },
                ["%"]   = { escape = true, close = true, pair = "%%", disabled_filetypes = { "text", "markdown", "md" } },
                ["$"]   = { escape = true, close = true, pair = "$$", enabled_filetypes = { "latex" } },
            },
            options = {
                disable_when_touch = true,
                pair_spaces = true,
                disabled_filetypes = {
                },
            },
        })
    end
}
