-- ══ TODO: ═══════════════════════════════════════════════════════════
--
--  - [ ] make copilot-cmp work
--  - [ ] add toggle for copilot https://github.com/LazyVim/LazyVim/discussions/4232
--  - [ ]
return {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    config = function ()
        require("copilot_cmp").setup()
    end,
    dependencies = {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = true },
                panel = { enabled = true },
            })
        end,
    },
}
