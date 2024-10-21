require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local createCommand = vim.api.nvim_create_user_command

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- copy lines up/down  
map("n", "<S-A-Down>", "yyp", { desc = "Copy line down"})


-- Move lines up/down
map("n", "<A-Down>", ":m .+1<CR>", { desc = "Move line down" })
map("n", "<A-j>", ":m .+1<CR>", { desc = "Move line down" })
map("n", "<A-Up>", ":m .-2<CR>", { desc = "Move line up" })
map("n", "<A-k>", ":m .-2<CR>", { desc = "Move line up" })
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })


-- lazygit
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- aliases to bypass  shift key typos 
createCommand('Qa', 'qa', { desc = "Quit all"})
createCommand('Wqa', 'wa', { desc = "Save and Quit all"})
