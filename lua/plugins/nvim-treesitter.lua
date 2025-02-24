--          ╔═════════════════════════════════════════════════════════╗
--          ║                  nvim-treesitter.nvim                   ║
--          ╚═════════════════════════════════════════════════════════╝

--          ┌─────────────────────────────────────────────────────────┐
--          │       nvim-treesitter.nvim provides better syntax       │
--          │ highlighting and code understanding using Tree-sitter.  │
--          └─────────────────────────────────────────────────────────┘


return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      local treesitter = require("nvim-treesitter.configs")

      require("nvim-ts-autotag").setup({
        incremental_selection = {
          enable = false,
          keymaps = {
            scope_incremental = "a",
            node_decremental = "z",
          },
        },
        highlight = {
          enable = true,
        },
        indent = { enable = true },
        autotag = { enable = true },
        ensure_installed = {
          "yaml",
          "markdown",
          "markdown_inline",
          "html",
          "css",
          "javascript",
          "lua",
          "gitignore",
          "nix",
          "python",
          "toml",
          "bash",
          "vim",
        },
        auto_install = true,
      })
    end,
  },
}
