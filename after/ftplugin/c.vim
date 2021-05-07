" -----------------------------------------------------------------------------
"     - General settings -
" -----------------------------------------------------------------------------
set nospell
set nowrap
set textwidth=99
set makeprg=zig\ c++\ %

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow


" -----------------------------------------------------------------------------
"     - Debugger -
" -----------------------------------------------------------------------------
let g:vebugger_path_gdb = 'gdb'


" -----------------------------------------------------------------------------
"     - Key mappings -
" -----------------------------------------------------------------------------
nmap <Leader>x :!clear;zig c++ % && ./a.out<cr>
nmap <C-b> :!clear;zig c++ %<cR>


" -----------------------------------------------------------------------------
"     - Abbreviations -
" -----------------------------------------------------------------------------
ia pp printf("",);<Left><Left>
ia cmt cmt<Leader>t<Left>

function DebugProject()
    let l:bin_path = './a.out'
    if filereadable(bin_path)
        let l:command = ':VBGstartGDB ' . bin_path
        execute command
    endif
endfunction

function RunDebuggerFromMain()
    " echo "building ..."
    " " Build project to ensure we have target/debug
    " let l:command = 'gcc build'
    " let l:output = system(command)
    call DebugProject()
endfunction

:command! RB call RunDebuggerFromMain()
