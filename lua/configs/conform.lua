require('conform').setup({
  formatters_by_ft = {
    python = { 'black' },
    html = { 'prettier' },
    css = { 'prettier' },
    nix = { 'alejandra' };
    htmldjango = { 'djlint' };
    -- markdown = { 'markdown-oxide' };
    -- other filetypes
  },
})
