local builtin = require('telescope.builtin')
-- pf = project files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- Git tracked files
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- ps = project string
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
