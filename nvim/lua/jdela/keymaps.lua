-- Keymaps
vim.keymap.set('n', '<C-b>', vim.lsp.buf.format, { desc = 'Keybind to test lsp formatters' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Go up half page, center cursor' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Go down half page, center cursor' })
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Write buffer (save)' })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Close buffer (quit)' })
-- vim.keymap.set('n', '<leader>s', '<C-W>s', { desc = 'Split window' })
vim.keymap.set('n', '<leader>sv', '<C-W>v', { desc = 'Split window vertical' })
vim.keymap.set('n', '<C-h>', '<C-W><C-H>', { desc = 'Cursor window left' })
vim.keymap.set('n', '<C-j>', '<C-W><C-J>', { desc = 'Cursor window down' })
vim.keymap.set('n', '<C-k>', '<C-W><C-K>', { desc = 'Cursor window up' })
vim.keymap.set('n', '<C-l>', '<C-W><C-L>', { desc = 'Cursor window right' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>ql', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Move lines up/down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
--  Commenting out in favor of vim/tmux navigator
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
