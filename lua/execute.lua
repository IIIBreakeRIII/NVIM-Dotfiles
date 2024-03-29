-- Python Compile Options
vim.api.nvim_command([[autocmd FileType python nnoremap <buffer> <F5> :term python %<CR>]])

-- C Lang Compile Options
vim.api.nvim_command([[autocmd FileType c nnoremap <buffer> <F5> :term gcc % && ./a.out<CR>]])

-- Swift Compile Options
vim.api.nvim_command([[autocmd FileType swift nnoremap <buffer> <F5> :term swift %<CR>]])

-- Java Compile Option
vim.api.nvim_command([[autocmd FileType java nnoremap <buffer> <F5> :term javac %<CR>]])
