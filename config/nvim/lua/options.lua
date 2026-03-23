local o = vim.opt

-- Backup / undo
o.backup = false
o.writebackup = false
o.swapfile = true
o.undofile = true

-- Line numbers
o.number = true
o.relativenumber = true
o.numberwidth = 4

-- General
o.clipboard = "unnamedplus"
o.cmdheight = 1
o.completeopt = { "menuone", "noselect" }
o.conceallevel = 0
o.hlsearch = false
o.ignorecase = true
o.smartcase = true
o.mouse = "a"
o.pumheight = 10
o.showmode = false
o.showtabline = 0
o.smartindent = false
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.timeoutlen = 1000
o.updatetime = 300
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.cursorline = true
o.signcolumn = "yes"
o.wrap = false
o.scrolloff = 8
o.sidescrolloff = 8

-- Title
o.title = true
o.titlestring = "NVIM - %<%F%="
o.titlelen = 100

-- GUI
o.guifont = "JetBrainsMono:h12"

-- Spell
o.spelllang = "en_au"

-- Folding defaults
o.foldcolumn = "auto"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
o.fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "" }

-- Messages
o.shortmess:append("c")

-- Extra settings
o.whichwrap:append("<,>,[,],h,l")
o.iskeyword:append("-")

-- NOTE: options.lua should only contain GLOBAL editor defaults.
-- Do NOT put plugin-dependent or buffer-specific settings here.

-- Things intentionally NOT configured here:

-- • fileencoding
--   - Buffer-local and usually unnecessary to set manually.
--   - Neovim already defaults to UTF-8.

-- • Bdelete command usage
--   - Comes from bufdelete.nvim plugin.
--   - Any mappings or commands using Bdelete should live in keymaps.lua.

-- • Filetype-specific behaviour
--   - Settings like wrap, spell, or indentation should be applied using:
--     - FileType autocommands
--     - after/ftplugin/*.lua files

-- • Language-specific indentation
--   - Example: Python shiftwidth=4
--   - Should be configured via FileType autocommands.

-- • Plugin UI overrides
--   - Plugin buffers (nvim-tree, telescope, terminals, etc.)
--   - Should adjust options using vim.opt_local inside plugin config or on_attach.

-- • Folding providers
--   - If using plugins like nvim-ufo or treesitter folding,
--   - folding behaviour should be finalized in the plugin configuration.

-- Rule of thumb:
--   options.lua = editor defaults
--   keymaps.lua = user keybindings
--   plugins/*   = plugin-specific behaviour
--   autocmds.lua / ftplugin = filetype or buffer-local overrides
