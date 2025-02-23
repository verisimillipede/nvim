--          ╔═════════════════════════════════════════════════════════╗
--          ║                       noice.nvim                        ║
--          ╚═════════════════════════════════════════════════════════╝

--          ┌─────────────────────────────────────────────────────────┐
--          │     noice.nvim enhances the Neovim command line and     │
--          │     message area with a modern and customizable UI.     │
--          └─────────────────────────────────────────────────────────┘


-- ══ TODO: and TIPS: ═════════════════════════════════════════════════
--
-- - [x] Add toggle for notifications
--
-- - Use ':NoiceHistory' to view the history of notifications


return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    -- toggle for notifications
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },

    vim.keymap.set("n", "<leader>tn", "<cmd>Noice dismiss<CR>", { desc = "Toggle notifications" })

  }
