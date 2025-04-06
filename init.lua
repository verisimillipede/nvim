vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.opt.smartindent = true

vim.opt.linebreak = true

vim.g.autoformat = true

-- add an 8 char buffer to the bottom of the viewport except for eof when scrolling
vim.opt.scrolloff = 8

-- turn off swap files and setup undodir
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "/home/mike/.vim/undodir"
vim.opt.undofile = true

-- incremental search highlights matches as you type
vim.opt.incsearch = true
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.opt.relativenumber = true
-- autosave
vim.api.nvim_create_autocmd(
  { "FocusLost", "ModeChanged", "TextChanged", "BufEnter" },
  { desc = "autosave", pattern = "*", command = "silent! update" }
)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.nix", "*.py", "*.html", "*.css", "*.js", "*.ts", "*.json", "*.yaml", "*.md", "*.lua" },
  callback = function()
    require("conform").format()
  end,
})
