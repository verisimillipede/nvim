return {
  "shortcuts/no-neck-pain.nvim",
  lazy = false,
  version = "*",
  config = function()
    require("no-neck-pain").setup {
      version = "*",
    }
  end,
}
