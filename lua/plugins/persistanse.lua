--          ╔═════════════════════════════════════════════════════════╗
--          ║                    persistense.nvim                     ║
--          ╚═════════════════════════════════════════════════════════╝

--          ┌─────────────────────────────────────────────────────────┐
--          │ persistense.nvim offers session management to save and  │
--          │                  restore editor state.                  │
--          └─────────────────────────────────────────────────────────┘



-- ══ TODO: ═══════════════════════════════════════════════════════════
--
--  - [ ] No setup function, maybe that's why it's not working


return {
    "folke/persistence.nvim",
    enabled = true,
    event = "BufReadPre",
    opts = {},
    -- stylua: ignore
    keys = {
        { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
        { "<leader>qS", function() require("persistence").select() end,desc = "Select Session" },
        { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
        { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
}
