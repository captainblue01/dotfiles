local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local group_names = {}


-- Leader
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Disable F1
map({ "n", "i", "v", "x" }, "<F1>", "<Nop>", opts)


-- Editing
map("i", "<C-BS>", "<C-W>", opts)
map("n", "<C-Backspace>", "daw", opts)

-- Windows
pcall(vim.keymap.del, "n", "<C-w>d")
pcall(vim.keymap.del, "n", "<C-w><C-d>")

-- Window resizing
map("n", "<CS-up>", "<cmd>resize +2<CR>", opts)
map("n", "<CS-down>", "<cmd>resize -2<CR>", opts)
map("n", "<CS-left>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<CS-right>", "<cmd>vertical resize +2<CR>", opts)
map("n", "<CS-k>", "<cmd>resize +2<CR>", opts)
map("n", "<CS-j>", "<cmd>resize -2<CR>", opts)
map("n", "<CS-h>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<CS-l>", "<cmd>vertical resize +2<CR>", opts)


-- Window navigation
map("n", "<C-left>", "<C-w>h", opts)
map("n", "<C-down>", "<C-w>j", opts)
map("n", "<C-up>", "<C-w>k", opts)
map("n", "<C-right>", "<C-w>l", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Window navigation from terminal mode (e.g. Snacks terminal)
map("t", "<C-left>", "<C-\\><C-n><C-w>h", opts)
map("t", "<C-down>", "<C-\\><C-n><C-w>j", opts)
map("t", "<C-up>", "<C-\\><C-n><C-w>k", opts)
map("t", "<C-right>", "<C-\\><C-n><C-w>l", opts)


-- Visual indent
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("v", "<C-,>", "<gv", opts)
map("v", "<C-.>", ">gv", opts)
map("v", "<C-left>", "<gv", opts)
map("v", "<C-right>", ">gv", opts)
map("v", "<C-h>", "<gv", opts)
map("v", "<C-l>", ">gv", opts)


-- Move selected text
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "<C-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<C-k>", ":move '<-2<CR>gv-gv", opts)
map("x", "<C-down>", ":move '>+1<CR>gv-gv", opts)
map("x", "<C-up>", ":move '<-2<CR>gv-gv", opts)


-- Splits
table.insert(group_names, { "<leader>s", group = "Splits", nowait = true, remap = false })

map("n", "<leader>sv", "<cmd>vsplit<CR>", vim.tbl_extend("force", opts, { desc = "Vertical Split" }))
map("n", "<leader>sh", "<cmd>split<CR>", vim.tbl_extend("force", opts, { desc = "Horizontal Split" }))
map("n", "<leader>sk", "<C-w>c", vim.tbl_extend("force", opts, { desc = "Window Kill" }))


-- Buffers
table.insert(group_names, { "<leader>b", group = "Buffers" , nowait = true, remap = false })

map("n", "<C-o>", "<cmd>bprevious<CR>", vim.tbl_extend("force", opts, { desc = "Previous Buffer" }))
map("n", "<leader>bp", "<cmd>bprevious<CR>", vim.tbl_extend("force", opts, { desc = "Previous Buffer" }))

map("n", "<C-p>", "<cmd>bnext<CR>", vim.tbl_extend("force", opts, { desc = "Next Buffer" }))
map("n", "<leader>bn", "<cmd>bnext<CR>", vim.tbl_extend("force", opts, { desc = "Next Buffer" }))

map("n", "<CS-TAB>", "<cmd>bprevious<CR>", vim.tbl_extend("force", opts, { desc = "Previous Buffer" }))
map("n", "<C-PageUp>", "<cmd>bprevious<CR>", vim.tbl_extend("force", opts, { desc = "Previous Buffer" }))
map("n", "<C-PageDown>", "<cmd>bnext<CR>", vim.tbl_extend("force", opts, { desc = "Next Buffer" }))

map("n", "<leader>bd",        
  function() 
    Snacks.bufdelete.delete() 
  end, 
  vim.tbl_extend("force", opts, { desc = "Close Buffer" }))


-- Save / Quit
table.insert(group_names, { "<leader>w", group = "Save" , nowait = true, remap = false })
table.insert(group_names, { "<leader>q", group = "Quit" , nowait = true, remap = false })

map("n", "<leader>wa", "<cmd>wa<CR>", vim.tbl_extend("force", opts, { desc = "Save all" }))
map("n", "<leader>ww", "<cmd>w<CR>", vim.tbl_extend("force", opts, { desc = "Save" }))

map("n", "<leader>qq", "<cmd>xa<CR><cmd>qa<CR>", vim.tbl_extend("force", opts, { desc = "Save Quit All" }))
map("n", "<leader>qQ", "<cmd>qa!<CR>", vim.tbl_extend("force", opts, { desc = "Quit without saving" }))
map("n", "<leader>Q", "<cmd>qa!<CR>", vim.tbl_extend("force", opts, { desc = "Quit without saving" }))

table.insert(group_names, { "<leader>a", group = "Claude" , nowait = true, remap = false })
table.insert(group_names, { "<leader>h", group = "Git Hunks" , nowait = true, remap = false })
return { group_names = group_names }
