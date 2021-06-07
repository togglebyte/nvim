set background=dark 

highlight clear SignColumn
highlight ColorColumn  ctermbg=234
highlight LineNr       ctermbg=234 ctermfg=14
highlight CursorLineNr ctermbg=23 ctermfg=7
highlight CursorLine   ctermbg=236
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=1   ctermfg=16
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1
highlight SpellCap     ctermbg=4   ctermfg=15
highlight VertSplit    ctermbg=6   ctermfg=0
highlight MatchParen   ctermbg=241
highlight SpellLocal   ctermbg=55
highlight Search       ctermfg=15 ctermbg=52

" highlight clear MatchParen
highlight DiffAdd      ctermbg=4   ctermfg=15
highlight DiffDelete   ctermbg=5   ctermfg=14
highlight DiffChange   ctermbg=238

" Code folding
highlight Folded ctermfg=1 ctermbg=0
highlight FoldColumn ctermfg=1 ctermbg=0

" Tab line
highlight TabLineFill ctermbg=234 ctermfg=7 term=NONE cterm=NONE
highlight TabLine ctermbg=236 ctermfg=230   term=NONE cterm=NONE
highlight TabLineSel ctermbg=240 ctermfg=7  term=NONE cterm=bold

" Debugger
highlight debugPC ctermbg=24
