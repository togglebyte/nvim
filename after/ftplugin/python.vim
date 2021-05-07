set nowrap
set textwidth=0
set nospell

" Don't jump to start with hash
setl nosmartindent

" Keybindings
nmap <C-b> :!clear;./manage.py test<CR>
nmap <Leader>x :!clear;python %<CR>

setlocal completeopt-=preview
