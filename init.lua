-- Configuration : setup files
require('vim-setup.setup')
require('vim-setup.key-bind')
require('lazy-setup.lazy')

vim.api.nvim_command([[autocmd FileType c nnoremap <buffer> <F5> :term gcc % && ./a.out<CR>]])
