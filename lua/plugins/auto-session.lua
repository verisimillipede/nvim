--          ╔═════════════════════════════════════════════════════════╗
--          ║                    auto-session.nvim                    ║
--          ╚═════════════════════════════════════════════════════════╝

--          ┌─────────────────────────────────────────────────────────┐
--          │    AutoSession takes advantage of Neovim's existing     │
--          │   session management capabilities to provide seamless   │
--          │              automatic session management.              │
--          └─────────────────────────────────────────────────────────┘

-- ══ TODO: ═══════════════════════════════════════════════════════════
--
-- - [ ] Create a function to automatically open neotree in all buffers
-- - [ ] Ensure buffer tabs display file name opposed to neo-tree placeholder text
-- - [ ] Add discriptions to all functions for better understanding

return {
  "rmagatti/auto-session",
  enabled = false,
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/popup.nvim",
  },
  -- event = "VeryLazy",
  config = function()
    -- local function close_neo_tree()
    --   require("neo-tree.sources.manager").close_all()
    -- end
    --
    -- local function close_aerial()
    --   local success, module = pcall(require, "aerial")
    --   if not success then
    --     return
    --   end
    --   module.close_all()
    -- end
    --
    -- local function open_neo_tree()
    --   vim.notify("opening neotree")
    --   require("neo-tree.sources.manager").show("filesystem")
    -- end

    require("auto-session").setup {

      auto_create = true,
      auto_restore = true,
      auto_save = true,
      log_level = "error",
      -- post_restore_cmds = { open_neo_tree },
      -- pre_save_cmds = { close_neo_tree, close_aerial},
      suppressed_dirs = { "~/", "~/Downloads", "/" },
      -- use_git_branch = true,
      cwd_change_handling = true,
      -- bypass_session_save_file_types = { "neo-tree" },
    }
    -- Set mapping for searching a session.
    -- ⚠️ This will only work if Telescope.nvim is installed
    if vim.fn.executable "fd" == 1 then
      -- sort by modify time
      cmd = {
        "sh",
        "-c",
        "fd --type f --exec stat --format '%Y %n' {} \\; | sort -rn | cut -d' ' -f2- | awk '{ sub(\"^./\", \"\"); print}'",
      }
    else
      cmd = {
        "sh",
        "-c",
        "find . -type f -exec stat -c '%Y %n' {} + | sort -rn | cut -d' ' -f2- | awk '{ sub(\"^./\", \"\"); print}'",
      }
    end
    function AutoSession_search_session()
      require("auto-session.session-lens").search_session {
        find_command = cmd,
        previewer = false,
      }
    end
    vim.keymap.set("n", "<leader>ss", AutoSession_search_session, { noremap = true })
  end,
}
