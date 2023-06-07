set guioptions=acM
" set guifont=FiraCode\ NF

if exists('g:GuiLoaded')
    GuiFont! FiraCode\ NF:h10
    GuiPopupmenu 0
    GuiTabline 0
    call GuiWindowMaximized(1)
endif

if exists('g:fvim_loaded')
    set guifont=Fira\ Code\ Retina:h14
    " FVimCursorSmoothMove v:true
    " FVimCursorSmoothBlink v:true

    FVimUIPopupMenu v:false
    " Font tweaks
    FVimFontAntialias v:true
    FVimFontAutohint v:true
    FVimFontHintLevel 'full'
    FVimFontLigature v:true
    " FVimFontNoBuiltInSymbols v:false " Disable built-in Nerd font symbols

    " Ctrl-ScrollWheel for zooming in/out
    nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
    nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
    nnoremap <A-CR> :FVimToggleFullScreen<CR>
endif

