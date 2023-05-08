-- leader key
vim.g.mapleader = " "

-- side numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- 4 space identation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- disable vim backups
vim.opt.swapfile = false
vim.opt.backup = false

-- enable undotree file backup
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- removes search highlights
vim.opt.hlsearch = false
-- incremental search highlight
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
