" vim: set ft=vim fdm=marker:

" Environment " {{{

" Clear & init vimrc augroup
augroup vimrc
    autocmd!
    au FileType asciidoc setlocal spell
    au FileType gitcommit setlocal spell
    au FileType markdown setlocal spell
    au FileType svn setlocal spell
augroup END

let mapleader = ','
let localleader = '_'

" set term=xterm-256color
set t_Co=256

if filereadable(expand('<sfile>:h') . '/init/plugins.vim')
    source <sfile>:h/init/plugins.vim
endif

let g:netrw_browsex_viewer = "chrome.exe"

" Less lag
set lazyredraw
set ttyfast

if has('clipboard')
    if has('unnamedplus')
        set clipboard=unnamed,unnamedplus
    else
        set clipboard=unnamed
    endif
endif

filetype plugin indent on
syntax on
set mousehide
scriptencoding utf-8

set shortmess+=filmnrxoOtT
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
set history=1000
set nospell
set hidden
set iskeyword-=.
set iskeyword-=#
set iskeyword-=-
set iskeyword-=_

set list
set listchars=tab:▸\ ,trail:⋅,eol:¬,nbsp:_,extends:»,precedes:« " invisible character

set tags=.tags,./tags,tags,../tags,~/.vimtags

" folding

set foldlevelstart=0
" set foldmethod=marker
" let &fmr = ' {{{, }}}'      " Put spaces between comment and marker
" autocmd vimrc BufNewFile,BufRead * :let &cms = ' ' . &cms " preppend space before comment marker

set backup
set undofile
set undolevels=1000
set undoreload=10000

if has('nvim')
    " https://github.com/neovim/neovim/issues/2897#issuecomment-115464516
    let g:terminal_color_0 = '#4e4e4e'
    let g:terminal_color_1 = '#d68787'
    let g:terminal_color_2 = '#5f865f'
    let g:terminal_color_3 = '#d8af5f'
    let g:terminal_color_4 = '#85add4'
    let g:terminal_color_5 = '#d7afaf'
    let g:terminal_color_6 = '#87afaf'
    let g:terminal_color_7 = '#d0d0d0'
    let g:terminal_color_8 = '#626262'
    let g:terminal_color_9 = '#d75f87'
    let g:terminal_color_10 = '#87af87'
    let g:terminal_color_11 = '#ffd787'
    let g:terminal_color_12 = '#add4fb'
    let g:terminal_color_13 = '#ffafaf'
    let g:terminal_color_14 = '#87d7d7'
    let g:terminal_color_15 = '#e4e4e4'

    set fillchars=vert:\|,fold:-  " restore vim defaults"
    set inccommand=split

    autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

" }}}

" UI " {{{

set background=dark
" color bubblegum-256-dark

" color monokai
" color behelit
" color base16-bright
" color triplejelly
" let g:seoul256_background = 235
" color seoul256
" let g:solarized_termcolors=256
" colorscheme solarized

" color base16-chalk
" let g:hybrid_use_Xresources = 1
" color hybrid

" color fixes to match overall os theme
hi StatusLineNC ctermfg=244 ctermbg=237 cterm=none guifg=#808080 guibg=#3A3A3A gui=none
hi vertsplit ctermbg=235

highlight clear SignColumn
highlight clear LineNr

set backspace=indent,eol,start
set ruler
" set rulerformat=%50(%=\%{fugitive#statusline()}\%y\ %l,%c%V\ %P%)
set showcmd
set linespace=1
set showmode
set nocursorline
set showmatch
set incsearch
set nohlsearch
set ignorecase
set smartcase
set wildmenu
set wildmode=list:longest,full
set whichwrap=b,s,h,l,<,>,[,]
set scrolljump=20
set scrolloff=10

" Formatting
set autoindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set nojoinspaces
set splitright
set splitbelow
set pastetoggle=<F12>

set formatoptions+=cqrn1j
" don't auto continue line comments
" autocmd vimrc FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Smart numbering
set nonumber
set norelativenumber
augroup linenumbers
    autocmd!
    autocmd BufEnter *    :set relativenumber
    autocmd BufLeave *    :set number norelativenumber
    autocmd WinEnter *    :set relativenumber
    autocmd WinLeave *    :set number norelativenumber
    autocmd InsertEnter * :set number norelativenumber
    autocmd InsertLeave * :set relativenumber
    autocmd FocusLost *   :set number norelativenumber
    autocmd FocusGained * :set relativenumber
augroup END


" Statusline funs " {{{

" statusline setup
set statusline =%#identifier#
set statusline+=[%t]    "tail of the filename
set statusline+=%*

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%#identifier#
set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%*

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

" set statusline+=%#identifier#
" set statusline+=%{fugitive#statusline()}
" set statusline+=%*

" display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#warningmsg#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%#identifier#
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%*

set statusline+=%#warningmsg#
set statusline+=%{StatuslineLongLineWarning()}
set statusline+=%*

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

"display a warning if &paste is set
set statusline+=%#warningmsg#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%#warningmsg#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%(%{StatuslineCurrentHighlight()}\ \ %)
set statusline+=%*

set statusline+=%#identifier#
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set statusline+=%*
set laststatus=2

"recalculate the trailing whitespace warning when idle, and after saving
autocmd vimrc cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction


"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd vimrc cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction

"recalculate the long line warning when idle and after saving
autocmd vimrc cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")

        if !&modifiable
            let b:statusline_long_line_warning = ''
            return b:statusline_long_line_warning
        endif

        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)
    let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
    return filter(line_lens, 'v:val > threshold')
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction

" set laststatus=1
" " set statusline=%{expand('%:p')}
" " set statusline+=%<\                          " cut at start
" set statusline+=%f\                            " file name
" set statusline+=%h%m%r%w                       " flags
" set statusline+=%=                             " right align
" set statusline+=[%{strlen(&ft)?&ft:'none'},    " filetype
" set statusline+=%{strlen(&fenc)?&fenc:&enc},   " encoding
" set statusline+=%{&fileformat}]                " file format
" set statusline+=%-8(\ (%l,%c)\ %)%P                  " line and column

" " set statusline+=%<%P                           " percentage of file
" set statusline=%<%f\                     " Filename
" set statusline+=%w%h%m%r                 " Options
" set statusline+=%{fugitive#statusline()} " Git Hotness
" set statusline+=\ [%{&ff}/%Y]            " Filetype
" set statusline+=\ [%{getcwd()}]          " Current dir
" set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

" }}}

" }}}

" Keybindings " {{{

" rebind since this is our leader
nnoremap ,, ,

" make Y consistent with rest of vim
nnoremap Y y$

" Easy esc
" inoremap jk <Esc> " mapped in multiplecursors
inoremap jk <Esc>
cnoremap jk <Esc>

"easy command mode
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Always use command and search window
" nnoremap ; q:
" nnoremap / q/
" nnoremap ? q?

" Move around easier
inoremap <C-o>       <Esc>o
inoremap <C-j>       <Down>
inoremap <C-k>       <Up>
cnoremap <C-j>       <Down>
cnoremap <C-k>       <Up>

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap <silent> j gj
noremap <silent> k gk

" <num>j or k now marks a jump location
nnoremap <silent> k :<C-u>execute 'normal!' (v:count > 1 ? "m'".v:count.'k' : 'gk')<Return>
nnoremap <silent> j :<C-u>execute 'normal!' (v:count > 1 ? "m'".v:count.'j' : 'gj')<Return>

"add new lines above/below current line.
nnoremap <silent> gO O<Esc>
nnoremap <silent> go o<Esc>

" Curly braces don't have to be at the start of the line
nnoremap <silent> [[ ?{<CR>
nnoremap <silent> ]] /}<CR>
map ][ j0[[%/{<CR>
map [] k$][%?}<CR>

"paste in insertmode
" inoremap <C-v> <C-r>+

nnoremap <C-h> <c-w>h
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l

if has('nvim')
  tnoremap <C-h> <c-\><c-n><c-w>h
  tnoremap <C-j> <c-\><c-n><c-w>j
  tnoremap <C-k> <c-\><c-n><c-w>k
  tnoremap <C-l> <c-\><c-n><c-w>l
endif

" Scroll the window next to the current one
"   (especially useful for two-window split)
nnoremap <silent> <leader>j <c-w>w<c-d><c-w>W
nnoremap <silent> <leader>k <c-w>w<c-u><c-w>W

" Sane N and n
noremap <expr> n 'Nn'[v:searchforward]
noremap <expr> N 'nN'[v:searchforward]

" Go to the first and last char of the line
noremap H ^
noremap L g_
xnoremap H ^
xnoremap L g_

" allows using incsearch to execute range command on a matched line
cnoremap ;t <CR>:t''<CR>
cnoremap ;m <CR>:m''<CR>
cnoremap ;d <CR>:d<CR>``

" Swap two lines using search
cnoremap <silent><expr> ;s getcmdtype() =~ '/\\|?\\|^$' ? "\<CR>:\<C-u>let l=[line(\"'`\"),line('.')]\\|exe max(l)'m'min(l)\\|exe min(l)'m'max(l)\\|exe l[0]\\|unl l\<CR>" : ';s'

" Make search results invisible
nnoremap <silent> <leader>/ :set invhlsearch<CR>
" Clear search
" nn <silent> <BS> :nohlsearch<CR>

" Find merge conflict markers
nnoremap <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

map Oa <C-Up>
map Ob <C-Down>
map Od <C-Left>
map Oc <C-Right>

"Duplicate lines above and below
inoremap <C-down> <esc>Ypk
nnoremap <C-down> yypk
xnoremap <C-down> y`>pgv
inoremap <C-up> <esc>yyPj
nnoremap <C-up> yyPj
xnoremap <C-up> y`<Pgv

" duplicate the selection
vnoremap D y`]pgv

" swap word under the cursor with previous word on the left
nnoremap <M-h>  "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o><C-l>
" swap word under the cursor with next word on the right
nnoremap <M-l> "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o>/\w\+\_W\+<CR><C-l>
" bubble lines up and down
nnoremap <M-k> ddkP
nnoremap <M-j> ddp

"Jump back to last edited buffer
nnoremap <space><tab> <C-^>
inoremap <C-b> <esc><C-^>

"toggle line numbers
nnoremap <leader>n :set number!<CR>

"Will open files in current directory, allows you to leave the working cd in
"the project root. You can also use %% anywhere in the command line to expand.
cnoremap %% <C-R>=expand('%:h').'/'<CR>
nnoremap <leader>ew :e %%
nnoremap <leader>es :sp %%
nnoremap <leader>ev :vsp %%
nnoremap <leader>et :tabe %%

" Change Working Directory to that of the current file
cnoremap cwd lcd %:p:h
cnoremap cd. lcd %:p:h

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" better dot-repeatability for search&replace
nnoremap <space>; *``cgn
nnoremap <space>, #``cgN

" better buffer/tab closing!
" nnoremap <space>c :bd<CR>
" nnoremap <space>C :tabclose<CR>

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
"
nnoremap <Space>z mzzMzvzz15<c-e>`z:Pulse<cr>

" Space to toggle folds.
nnoremap <Space>v za
vnoremap <Space>v za

" super quick search and replace
nnoremap <Space>x :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <Space>% :%s/\<<C-r>=expand("<cword>")<CR>\>/

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO

" split edit vimrc
nnoremap <leader>ev <C-w><C-s><C-l>:e $MYVIMRC<CR>

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" noremap <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
" nnoremap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Easy formatting
nnoremap <silent> <leader>q gwie

" }}}

" Functions " {{{

function! CustomFoldHeader() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')
    let lineoffset = 3
    if &foldmethod == 'marker'
        let lineoffset = (len(&fmr)+1)/2 + 3
    endif

    let line = strpart(line, 0, windowwidth - len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - lineoffset
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction
set foldtext=CustomFoldHeader() " }}}

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" Restore cursor to file position in previous editing session
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" Make directory automatically.
" --------------------------------------
" http://vim-users.jp/2011/02/hack202/
autocmd vimrc BufWritePre *
            \ call s:mkdir_as_necessary(expand('<afile>:p:h'), v:cmdbang)
function! s:mkdir_as_necessary(dir, force)
    if !isdirectory(a:dir) && &l:buftype == '' &&
                \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
                \              a:dir)) =~? '^y\%[es]$')
        call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
endfunction


" Initialize directories
function! InitializeDirectories()
    let parent = $HOME
    let prefix = 'vim'
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    let common_dir = parent . '/.' . prefix

    for [dirname, settingname] in items(dir_list)
        let directory = common_dir . dirname . '/'
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()

function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd vimrc FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> call StripTrailingWhitespace()
autocmd vimrc FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd InsertLeave <buffer> call StripTrailingWhitespace()
nnoremap <silent> <leader>ws :call StripTrailingWhitespace()<CR>


function! s:RunShellCommand(cmdline) " {{{
    botright new

    setlocal buftype=nofile
    setlocal bufhidden=delete
    setlocal nobuflisted
    setlocal noswapfile
    setlocal wrap
    setlocal filetype=shell
    setlocal syntax=shell

    call setline(1, a:cmdline)
    call setline(2, substitute(a:cmdline, '.', '=', 'g'))
    execute 'silent $read !' . escape(a:cmdline, '%#')
    setlocal nomodifiable
    1
endfunction " }}}

command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
" e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %

command! -nargs=1 Silent
            \ | execute ':silent !'.<q-args>
            \ | execute ':redraw!'

let g:indentguides_state = 0
function! IndentGuides() " {{{
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction " }}}
hi def IndentGuides guibg=#303030 ctermbg=236
nnoremap <leader>I :call IndentGuides()<cr>

function! StartNewParaDown()
  if getline(line(".")) =~ '\v^' . strpart(&commentstring,0,1) . '?$'
    if getline(line(".")-1) =~ '\v^' . strpart(&commentstring,0,1) . '?$'
      if getline(line(".")+1) =~ '\v^' . strpart(&commentstring,0,1) . '?$'
      " case 000
        if strlen(getline(line("."))) == 0
          return "a"
        else
          return "a\<Space>"
        endif
      else
      " case 001
        if strlen(getline(line("."))) == 0
          return "O"
        else
          return "O\<Space>"
        endif
      endif
    else
      if getline(line(".")+1) =~ '\v^' . strpart(&commentstring,0,1) . '?$'
      " case 100
        if strlen(getline(line("."))) == 0
          return "o"
        else
          return "o\<Space>"
        endif
      else
      " case 101
        if strlen(getline(line("."))) == 0
          return "O\<CR>"
        else
          return "O\<CR>\<Space>"
        endif
      endif
    endif
  else
    if getline(line(".")+1) =~ '\v^' . strpart(&commentstring,0,1) . '?$'
    " case x10
      return "o\<CR>"
    else
    " case x11
      return "o\<Esc>ko\<CR>"
    endif
  endif
endfunction

function! StartNewParaUp()
  if getline(line(".")) =~ '\v^' . strpart(&commentstring,0,1) . '?$'
    if getline(line(".")-1) =~ '\v^' . strpart(&commentstring,0,1) . '?$'
      if getline(line(".")+1) =~ '\v^' . strpart(&commentstring,0,1) . '?$'
      " case 000
        if strlen(getline(line("."))) == 0
          return "a"
        else
          return "a\<Space>"
        endif
      else
      " case 001
        if strlen(getline(line("."))) == 0
          return "O"
        else
          return "O\<Space>"
        endif
      endif
    else
      if getline(line(".")+1) =~ '\v^' . strpart(&commentstring,0,1) . '?$'
      " case 100
        if strlen(getline(line("."))) == 0
          return "o"
        else
          return "o\<Space>"
        endif
      else
      " case 101
        if strlen(getline(line("."))) == 0
          return "O\<CR>"
        else
          return "O\<CR>\<Space>"
        endif
      endif
    endif
  else
    if getline(line(".")-1) =~ '\v^' . strpart(&commentstring,0,1) . '?$'
    " case 01x
      if getline(line(".")) !~ '\v^\s*' . strpart(&commentstring,0,1) . '.*$'
        return "O\<Esc>O"
      else
        return "O\<Esc>O\<Space>"
      endif
    else
    " case 11x
      if getline(line(".")) !~ '\v^\s*' . strpart(&commentstring,0,1) . '.*$'
        return "O\<Esc>O\<CR>"
      else
        return "O\<Esc>O\<CR>\<Space>"
      endif
    endif
  endif
endfunction

nnoremap <expr> <Leader>o StartNewParaDown()
nnoremap <expr> <Leader>O StartNewParaUp()

" make list-like commands more intuitive
function! CCR()
    let cmdline = getcmdline()
    if cmdline =~ '\v\C^(ls|files|buffers)'
        " like :ls but prompts for a buffer command
        return "\<CR>:b"
    elseif cmdline =~ '\v\C/(#|nu|num|numb|numbe|number)$'
        " like :g//# but prompts for a command
        return "\<CR>:"
    elseif cmdline =~ '\v\C^(dli|il)'
        " like :dlist or :ilist but prompts for a count for :djump or :ijump
        return "\<CR>:" . cmdline[0] . "j  " . split(cmdline, " ")[1] . "\<S-Left>\<Left>"
    elseif cmdline =~ '\v\C^(cli|lli)'
        " like :clist or :llist but prompts for an error/location number
        return "\<CR>:sil " . repeat(cmdline[0], 2) . "\<Space>"
    elseif cmdline =~ '\C^old'
        " like :oldfiles but prompts for an old file to edit
        set nomore
        return "\<CR>:sil se more|e #<"
    elseif cmdline =~ '\C^changes'
        " like :changes but prompts for a change to jump to
        set nomore
        return "\<CR>:sil se more|norm! g;\<S-Left>"
    elseif cmdline =~ '\C^ju'
        " like :jumps but prompts for a position to jump to
        set nomore
        return "\<CR>:sil se more|norm! \<C-o>\<S-Left>"
    elseif cmdline =~ '\C^marks'
        " like :marks but prompts for a mark to jump to
        return "\<CR>:norm! `"
    elseif cmdline =~ '\C^undol'
        " like :undolist but prompts for a change to undo
        return "\<CR>:u "
    else
        return "\<CR>"
    endif
endfunction
cnoremap <expr> <CR> CCR()

function! s:Pulse() " {{{
    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 8
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor
    for i in range(end, start, -1 * width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor
    execute 'hi ' . old_hi
endfunction " }}}
command! -nargs=0 Pulse call s:Pulse()


" }}}
