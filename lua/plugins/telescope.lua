--          ╔═════════════════════════════════════════════════════════╗
--          ║                     telescope.nvim                      ║
--          ╚═════════════════════════════════════════════════════════╝

--          ┌─────────────────────────────────────────────────────────┐
--          │   telescope.nvim is a highly extendable fuzzy finder    │
--          │      over lists, such as files, buffers, and more.      │
--          └─────────────────────────────────────────────────────────┘


return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')

    -- Keymaps for Telescope
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
    vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "Git Files" })
    vim.keymap.set('n', '<leader>gs', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, { desc = "Grep Search" })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "List Buffers" })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help Tags" })
  end
}
