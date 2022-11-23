-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- open up Vim cheatsheet
keymap.set("n", "gc", ":vsp ~/code/vim-cheatsheet/cheatsheet.txt<cr>:vertical resize 100<cr>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>") -- list Todos

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- trouble
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>") -- toggle the touble window on/off
keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>") -- open trouble window scoped to workspace
keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>") -- open trouble window scoped to current document
keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>") -- open quickfix window
keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>") -- open loclist window
keymap.set("n", "<leader>xt", "<cmd>TodoTrouble<cr>") -- open list of Todos

-- hop
local hop = require("hop")
local directions = require("hop.hint").HintDirection
vim.keymap.set("", "f", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("", "F", function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("", "t", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
vim.keymap.set("", "T", function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })
keymap.set("n", "<leader>hh", "<cmd>HopChar1<cr>") -- hop to single letter
keymap.set("n", "<leader>hj", "<cmd>HopChar2<cr>") -- hop to pair of letters
keymap.set("n", "<leader>H", "<cmd>HopWord<cr>") -- hop to all words
keymap.set("n", "<leader>hl", "<cmd>HopLineStart<cr>") -- hop to line start

-- rust-tools
keymap.set("n", "<leader>rr", "<cmd>RustRunnables<cr>") -- quicklist of all the runnable options in the open buffer
keymap.set("n", "<leader>rh", "<cmd>RustHoverActions<cr>") -- open up drop-down of actions at the cursor
keymap.set("n", "<leader>re", "<cmd>RustExpandMacro<cr>") -- Expand macro under cursot recursively

-- debugging
keymap.set("n", "<leader>b", "<cmd>lua require('dap').toggle_breakpoint()<cr>")
keymap.set("n", "<F5>", "<cmd>lua require('dap').continue()<cr>")
keymap.set("n", "<F10>", "<cmd>lua require('dap').step_over()<cr>")
keymap.set("n", "<F11>", "<cmd>lua require('dap').step_into()<cr>")

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
