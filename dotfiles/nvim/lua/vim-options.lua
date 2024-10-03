vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<leader>pv', ':tabe .<CR>', {})
vim.api.nvim_set_keymap('n', 'q', '', {})
-- vim.api.nvim_set_keymap('n', 'yy', 'y$', {})
vim.api.nvim_set_keymap('n', '<leader>b', ':b<space><C-D>', {})
-- vim.api.nvim_set_keymap('v', '<Leader>y', "<Esc>:'<,'>w !xclip -sel clip -r<CR><CR>", {})
vim.api.nvim_set_keymap('v', '<Leader>y', 'y:lua vim.cmd([[call system("xclip -sel clip -i", @")]])<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>yw', [[ :r !cat % | xclip -sel clip -r<CR> ]], {})
vim.api.nvim_set_keymap('n', '<Leader>yf', [[ :r !echo %:p | xclip -sel clip -r<CR> ]], {})
vim.api.nvim_set_keymap('n', '<Leader>pp', ':set paste!<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>tt', ':set expandtab<CR>:retab<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>l', ':set list!<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>gx', ':r !firefox %<CR>', {})

vim.cmd('syntax enable')
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.wo.number = true
vim.o.laststatus = 3
--vim.opt.winbar = '%=%=%m %f'
vim.opt.showmode = false
vim.o.ignorecase = true
vim.o.smartcase = true

if vim.fn.has("termguicolors") then
  vim.o.termguicolors = true
end

vim.opt.path:append('**')
vim.o.wildmenu = true
vim.opt.wildignore:append('**/node_modules/**')
vim.o.splitbelow = true
vim.o.splitright = true
vim.wo.relativenumber = true

vim.api.nvim_exec([[
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
]], false)

vim.api.nvim_set_keymap('n', '<F5>', '"=strftime("%c")<CR>P', {})
vim.api.nvim_set_keymap('i', '<F5>', '<C-R>=strftime("%c")<CR>', {})
vim.o.listchars = vim.o.listchars .. ',space:␣'
vim.o.listchars = vim.o.listchars .. ',eol:$'

-- Experimental
-- LSP warning in a floating window
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
-- Remap CTRL-\ CTRL-N to Esc in Neovim terminal-emulator
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})
-- Always show sign column to prevent jumping
vim.opt.signcolumn = "yes"

-- Disable mouse
vim.opt.mouse = ""

-- vim.g.emmet_leader_key = '<C-y>,'

-- Preserve indentation for wrapped lines
vim.opt.breakindent = true

