" -----------------------------------------------------------------------------
"     - General settings -
" -----------------------------------------------------------------------------
set textwidth=99


" -----------------------------------------------------------------------------
"     - Key mappings -
" -----------------------------------------------------------------------------
nmap <C-b> :Compile<CR>
nmap <Leader>x :Cargo run<CR>
nmap <Leader>b :Cargo test -- --nocapture<CR>
nmap <S-k> :call RustDocs()<CR>
nmap <Leader>f :RustFmt<CR>
nmap <Leader>B :!clear;env RUST_BACKTRACE=1 cargo test -- --nocapture<CR>
nmap gd <Plug>(rust-def)
nmap gv <Plug>(rust-def-vertical)
nmap <F5> :call RunDebugger()<CR>
nmap <leader>] :cnext<CR>
nmap <leader>[ :cprev<CR>

" -----------------------------------------------------------------------------
"     - Abbreviations -
" -----------------------------------------------------------------------------
ia pp eprintln!("{:?}",);<Left><Left>
ia pl! println!("{:?}",);<Left><Left>
ia cmt cmt<Leader>t<Left>
ia dd #[derive(Debug)]

