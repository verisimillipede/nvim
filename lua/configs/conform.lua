require('conform').setup({
  formatters_by_ft = {
    python = { 'black' },
    -- other filetypes
  },
  format_on_save = {
    enabled = true,
    pattern = { '*.py' },
  },
})
