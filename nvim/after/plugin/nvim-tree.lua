-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  hijack_cursor = true,
  respect_buf_cwd = true,
  sort_by = "case_sensitive",
  view = {
    width = 30,
    side = "right",
  },
  actions = {
      open_file = {
          quit_on_open = true,
      },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', {})
