return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  event = "VeryLazy",
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",  -- Add this if you're using nvim-cmp for completion
  },
  config = function()
    require("obsidian").setup {
      workspaces = {
        {
          name = "zettlekasten",
          path = "~/Documents/Zettlekasten/",
        },
        {
          name = "mbdtv",
          path = "~/Documents/My Beautiful, Dark, Twisted Vault/",
        },
      },
      notes_subdir = "Inbox",
      -- set daily notes to be created in journal directory
      -- daily_notes = {
          --   directory = "~/Documents/Zettlekasten/journal/",
      -- },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "Journal",
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = "%Y-%m-%d",
      },
      ---@param url string
      follow_url_func = function(url)
        -- Open the URL in the default web browser.
        -- vim.fn.jobstart({"open", url})  -- Mac OS
        -- vim.fn.jobstart({"xdg-open", url})  -- linux
        -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
        vim.ui.open(url) -- need Neovim 0.10.0+
      end,
      disable_frontmatter = true,
      note_frontmatter_func = nil,
      ui = { enable = false },

      -- Customize how note file names are generated using the title
      ---@param spec { id: string, dir: obsidian.Path, title: string|? }
      ---@return string|obsidian.Path The full path to the new note.
      note_path_func = function(spec)
          local title = spec.title or spec.id
          -- Use the title directly for the file name
          local file_name = title  -- Keep spaces and all characters
          local path = spec.dir / file_name
          return path:with_suffix(".md")
      end,
    }
  end,
}
