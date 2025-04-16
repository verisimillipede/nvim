--          ╔═════════════════════════════════════════════════════════╗
--          ║                         Keymaps                         ║
--          ╚═════════════════════════════════════════════════════════╝

--          ┌─────────────────────────────────────────────────────────┐
--          │     This file defines custmm keymaps in Neovim for      │
--          │   improved navigation, editing, and task management,    │
--          │             enhancing workflow efficiency.              │
--          └─────────────────────────────────────────────────────────┘

-- ══ TODO: ═══════════════════════════════════════════════════════════
--
-- - [x] Add shortcuts to common directories, such as nvim, dotfiles, Zealot, etc. Not necessary with auto-session and command line
-- - [x] Create a keymap to open new BLANK line below a comment
-- - [x] Create keymap for deleting all contents of a file
-- - [x] Reformat lunarvim keymaps
-- - [x] Create TODO script
-- - [x] Create new TODO item keymap
-- - [x] Add keymap to swap windows left to right
-- - [x] Add keymap to open line a new line at the end of the file
-- - [x] Create keymap to "check" a TODO item
-- - [ ] Update ^^^^^^ to restore cursor to original position
-- - [ ] Can I make it possible to undo entire TODO item with one undo?

require "nvchad.mappings"

vim.g.mapleader = " " -- Set space as the leader key

local keymap = vim.keymap.set -- the new way of setting keymaps

-- Open new line at end of file
keymap("n", "<leader>A", "Go", { desc = "Open new line at end of file" })

-- Source keymaps.lua
keymap("n", "<leader>R", ":source /home/mike/.config/nvchad/lua/mappings.lua", { desc = "Source keymaps.lua" })

-- Smooth scrolling
-- keymap("n", "<C-d>", "<C-d>zz")
-- keymap("n", "<C-u>", "<C-u>zz")

-- Toggle NoNeckPain
keymap("n", "nnp", "<CMD>NoNeckPain<CR>", { desc = "Activate NoNeckPain" })

-- Kill current buffer
keymap("n", "<leader>kb", "<cmd>bd<CR>", { desc = "Kill current buffer" })

-- Kill all buffers except current
keymap("n", "<leader>ka", "<cmd>%bd|e#|bd#<CR>", { desc = "Kill all buffers except current" })

-- See `:help telescope.builtin`
keymap("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" }) -- github:aokon
keymap("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" }) -- github:aokon
keymap("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = "[/] Fuzzily search in current buffer]" }) -- github:aokon

-- Bold selected text
keymap("v", "<C-b>", "xi****<ESC>hhp", { desc = "Mark Done" })

keymap("n", "<C-b>", "bvexi****<ESC>hhp", { desc = "Mark Done" })

-- ToggleTerm
keymap("n", "<leader>tt", "<CMD>ToggleTerm<CR>", { desc = "Open ToggleTerm" })

-- Move current line/block in insert mode
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move current line / block down" }) -- lunarvim
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move current line / block up" }) -- lunarvim

-- Save
keymap("n", "<leader>ww", "<CMD>update<CR>", { desc = "Save" })

-- Quit
keymap("n", "<leader>q", "<CMD>qa<CR><CR>", { desc = "Quit" })

-- Exit insert mode
-- keymap("i", "jk", "<ESC>")

-- keymap("n", ";", ":")

-- Navigate one line at a time, even with wrapped lines
keymap({ "n", "v" }, "j", "gj", { desc = "Move down one line, even with wrapped lines" })
keymap({ "n", "v" }, "k", "gk", { desc = "Move up one line, even with wrapped lines" })

-- NeoTree
keymap("n", "<leader>e", "<CMD>Neotree toggle<CR>", { desc = "Toggle NeoTree" })
keymap("n", "<leader>tf", "<CMD>Neotree focus<CR>", { desc = "Tree Focus" })

-- -- Tabs
-- keymap("n", "<leader><tab><tab>", "<CMD>tabnew<CR>", { desc = "New tab" })
-- keymap("n", "<tab>", "gt", { desc = "Next tab" })
-- keymap("n", "<S-tab>", "gT", { desc = "Previous tab" })
-- keymap("n", "<leader>tc", "<CMD>tabclose<CR>", { desc = "Close tab" })

keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Navigate to the left tmux pane" })
keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Navigate to the bottom tmux pane" })
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Navigate to the top tmux pane" })
keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Navigate to the right tmux pane" })
keymap("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "Navigate to the previous tmux pane" })

-- Undotree
-- keymap("n", "<leader>u", "<CMD>UndotreeToggle<CR>", { desc = "Toggle undotree" })

-- New Windows
keymap("n", "<leader>ow", "<CMD>vsplit<CR>", { desc = "Open a new window vertically" })
keymap("n", "<leader>sp", "<CMD>split<CR>", { desc = "Open a new window horizontally" })

keymap("n", "<A-s>", "<C-w>r", { desc = "Swap windows left to right" })

-- Resize Windows
keymap("n", "<C-Left>", "<C-w><", { desc = "Resize window to the left" })
keymap("n", "<C-Right>", "<C-w>>", { desc = "Resize window to the right" })
keymap("n", "<C-Up>", "<C-w>+", { desc = "Resize window up" })
keymap("n", "<C-Down>", "<C-w>-", { desc = "Resize window down" })

-- Indent Blocks
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Helix inspired remaps, go home and go long
keymap("n", "gh", "^", { desc = "[G]oto first char in line (h is chosen because its also a left movement" }) -- props to whoever came up with these
keymap("n", "gl", "$", { desc = "[G]oto last char in line (l is chosen because its also a right movement" })

-- Drag selected lines up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Drag selection down one line" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Drag selection up one line" })

-- Keep cursor in place as you are appending rows
keymap("n", "J", "mzJ`z", { desc = "Keep cursor in place when appending rows" })

-- keep search terms in the middle of the screen
keymap("n", "n", "nzzzv", { desc = "Keep next search term in the middle of the screen" })
keymap("n", "N", "Nzzzv", { desc = "Keep previous search terms in the middle of the screen" })

-- -- yanks into a secondary buffer so you dont lose your yank
-- keymap("x", "<leader>p", [["_dP]], { desc = "Yank into an alternate buffer so it doesnt get lost" })

-- Yank to system clipboard
keymap("v", "<leader>y", '"+y', { desc = "Yank selection to system clipboard" }) --asbjornHaland
keymap("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" }) --asbjornHaland

-- Delete without yanking
-- keymap({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Delete entire contents of current buffer
-- keymap("n", "<leader>dd", ":%d<CR>", { desc = "Delete entire contents of current buffer" })

-- LSP
keymap("n", "<leader>fp", "<cmd>!black %<CR>", { desc = "[F]ormat [P]ython file" })

-- -- Make current file executable
-- keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Add executable permissions to the current buffer" })

-- Replace the word under cursor thoughout the file
keymap("n", "<leader>cw", [[:%s/<C-r><C-w>//gc<Left><Left><Left>]], { desc = "Replace word under cursor" })

-- https://github.com/oyinbra/nvim-config
-- Config inspo: slydragonn/maps.lua
keymap({ "n", "t" }, "<A-m>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

