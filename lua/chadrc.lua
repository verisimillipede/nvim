-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "zenburn",

  hl_override = {
    CursorLine = { bg = "#3a4448" },
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    -- Visual = { bg = "#61696C" },
  },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
