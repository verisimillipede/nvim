--          ╔═════════════════════════════════════════════════════════╗
--          ║                      neo-tree.nvim                      ║
--          ╚═════════════════════════════════════════════════════════╝

--          ┌─────────────────────────────────────────────────────────┐
--          │    `neo-tree.nvim` provides a file explorer tree for    │
--          │   navigating and managing project files efficiently.    │
--          └─────────────────────────────────────────────────────────┘


-- ══ TODO: ═══════════════════════════════════════════════════════════
--
-- - [ ] Add keymap to refocus on current buffer
-- - [ ] Add file preview on hover
-- - [ ] provide image preview support


return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  branch = "v3.x",
  lazy = false,
  priority = 1000,
  keys = {
    { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window
  },

  opts = {
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,

    default_component_configs = {
      indent = {
        indent_size = 2,
        padding = 1, -- extra padding on left hand side
        with_markers = true,
        indent_marker = "|",
        last_indent_marker = "|",
        highlight = "NeoTreeIndentMarker",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        default = "*",
      },
      root = {
        icon = "",
        highlight = "NeoTreeRoot",
      },
      git_status = {
        symbols = {
          added = "✚",
          modified = "",
          deleted = "✖",
          renamed = "renamed",
          untracked = "",
          ignored = "",
          unstaged = "unstaged",
          staged = "",
          conflict = "",
        },
      },
    },

    window = {
      position = "left",
      width = 40,
      mappings = {
        ["<space>"] = "toggle_node",
        ["<2-LeftMouse>"] = "open",
        ["<cr>"] = "open",
        ["S"] = "open_split",
        ["s"] = "open_vsplit",
        ["C"] = "close_node",
        ["R"] = "refresh",
        ["a"] = "add",
        ["d"] = "delete",
        ["r"] = "rename",
        ["c"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["y"] = "copy",
        ["m"] = "move",
        ["q"] = "close_window",
      },
    },

    nesting_rules = {},

    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_hidden = true, -- only works on Windows for hidden files/directories
        hide_by_name = {
          ".DS_Store",
          "thumbs.db",
        },
        hide_by_pattern = { -- uses glob style patterns
          "*.meta",
        },
        always_show = { -- remains visible even if other settings would normally hide it
          ".gitignored",
        },
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          ".DS_Store",
          "thumbs.db",
        },
        never_show_by_pattern = { -- uses glob style patterns
          ".null-ls_*",
        },
      },
      follow_current_file = {
        enable = true,
      },
      group_empty_dirs = false, -- when true, empty folders will be grouped together
      hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
      use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
    },

    buffers = { -- now properly indented
      follow_current_file = {
          enable = true,
      },-- This will find and focus the file in the active buffer every time
      group_empty_dirs = true, -- when true, empty folders will be grouped together
      show_unloaded = true,
    },

    git_status = { -- now properly indented
      window = {
        position = "float",
        mappings = {
          ["A"] = "git_add_all",
          ["gu"] = "git_unstage_file",
          ["ga"] = "git_add_file",
          ["gr"] = "git_revert_file",
          ["gc"] = "git_commit",
          ["gp"] = "git_push",
          ["gg"] = "git_commit_and_push",
        },
      },
    },
  },
}
