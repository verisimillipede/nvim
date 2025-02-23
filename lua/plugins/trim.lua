--          ╔═════════════════════════════════════════════════════════╗
--          ║                        trim.nvim                        ║
--          ╚═════════════════════════════════════════════════════════╝

--          ┌─────────────────────────────────────────────────────────┐
--          │ trim.nvim automatically trims trailing whitespace from  │
--          │                         lines.                          │
--          └─────────────────────────────────────────────────────────┘


return {
    "cappyzawa/trim.nvim",
    config = function()
        require("trim").setup({
            ft_blocklist = { "markdown" },
            highlight = false,
            trim_on_write = true,
            trim_trailing = true,
            trim_last_line = true,
        })
    end,
}
