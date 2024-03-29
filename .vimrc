let g:solarized_termtrans=1
filetype on
filetype plugin indent on
syntax enable
:set nocompatible
:set tabstop=4
:set shiftwidth=4
:set expandtab
:set hls!
:set ruler
:set number
:set nostartofline
:set clipboard=unnamed
:set backspace=indent,eol,start
:set hlsearch
:set completeopt-=preview
" Set xml syntax highlighting for ros
autocmd bufread *.launch exe "setf xml"
":set nohlsearch
set background=dark
" set background=light
"
" fzf
if has("gui_running")
  " Gvim
  if has("gui_gtk2") || has("gui_gtk3")
    " Linux GUI
  elseif has("gui_win32")
    " Win32/64 GVim
  elseif has("gui_macvim")
    " MacVim
    set rtp+=/usr/local/opt/fzf
  else
    echo "Unknown GUI system!!!!"
  endif
else
  " Terminal vim
  set rtp+=~/.fzf
endif

" noremap <c-p> :Files<cr>
noremap <c-t> :Files<cr>

" packloadall
silent! helptags ALL

" load vim-speeddating if in orgmode
au BufRead,BufNewFile *.org set filetype=org
" autocmd FileType org packadd vim-speeddating
" autocmd FileType org packadd vim-orgmode
" autocmd FileType org edit!

augroup scxml_ft
  au!
  autocmd BufNewFile,BufRead *.scxml   set syntax=xml
augroup END

autocmd BufReadPre,BufNewFile *.org packadd vim-repeat
autocmd BufReadPre,BufNewFile *.org packadd calendar.vim
autocmd BufReadPre,BufNewFile *.org packadd SyntaxRange
autocmd BufReadPre,BufNewFile *.org packadd utl.vim
autocmd BufReadPre,BufNewFile *.org packadd vim-speeddating
autocmd BufReadPre,BufNewFile *.org packadd vim-orgmode

" Functions to see a diff from the last save inside of vim
:command Diff w !diff % -
:command Tkdiff w !tkdiff % /dev/stdin
:command Fold setlocal foldmethod=syntax
:command Sign %s/@author.*/@author Christopher Richardson <christopher.richardson@gtri.gatech.edu>
" :command Sign %s/\(.*\)author\(.*\)$/\1author\2 Christopher Richardson <christopher.richardson@gtri.gatech.edu>
" colorscheme solarized

" vim-airline settings
" let g:airline_theme = 'solarized'
" let g:airline_solarized_bg='dark'
" let g:airline_solarized_bg='light'
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_b = ''
let g:airline_section_c = ''

" ale
" let g:ale_fixers = {
"   \ '*': ['remove_trailing_lines', 'trim_whitespace'],
"   \}
" let g:ale_fix_on_save = 1
" let g:ale_linters = {'cpp': ['cppcheck', 'cpplint']}
" let g:ale_lint_on_enter = 1
" with ccls
" let g:ale_completion_enabled = 1
" noremap <c-]> :ALEGoToDefinition<cr>
" map <leader>al :ALEToggle<CR>

"This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

" gutentags
" let g:gutentags_ctags_tagfile = '.git/tags'

" " term functions
" function InsertOnTerm()
"   if index(term_list(),bufnr('%')) != -1
"     normal i
"     normal :
"   endif
" endfunction

" function ForceQuitIfTerm()
"   if index(term_list(),bufnr('%')) != -1
"     quit!
"   else
"     quit
"   endif
" endfunction

:command Term term ++curwin
:command NTerm tabnew | Term
:command D bp|bd #

"""""" REMAPS """"""
" move cursor to beginning/end of line
nnoremap <c-h> <Home>
nnoremap <c-l> <End>
vnoremap <c-h> <Home>
vnoremap <c-l> <End>
nnoremap <c-k> B
nnoremap <c-j> E
vnoremap <c-k> B
vnoremap <c-j> E
" quick jumps
nnoremap <s-k> 10k
nnoremap <s-j> 10j
vnoremap <s-k> 10k
vnoremap <s-j> 10j
nnoremap <s-q> J
vnoremap <s-q> J
" tab remaps
" nnoremap <c-t> :tabnew<CR>
" tnoremap <c-t> <c-\><c-n>:tabnew<CR>
" buffer cycling
nnoremap <c-i> :bprev<CR>
nnoremap <c-o> :bnext<CR>

" local leader mappings
let maplocalleader="\<space>"
nnoremap <localleader>t :rightb vert terminal<cr>
" nnoremap <localleader>pw viwp

function WrapCout()
  :exe "norm Istd::cout << "
  :exe "norm A << std::endl;"
endfunction

" :autocmd FileType cpp nnoremap <buffer> <localleader>oo Istd::cout << <esc>A << std::endl;<esc>
:autocmd FileType cpp nnoremap <buffer> <localleader>oo :call WrapCout()<CR>
:autocmd FileType cpp noremap <silent> <buffer> <localleader>o :call WrapCout()<CR>
:autocmd FileType cpp noremap <silent> <buffer> <localleader>i :YcmCompleter GoToInclude<CR>
:autocmd FileType cpp noremap <silent> <buffer> <localleader>[ :YcmCompleter GoToDeclaration<CR>
:autocmd FileType cpp noremap <silent> <buffer> <localleader>] :YcmCompleter GoToDefinition<CR>

" save current session
function! s:SaveCurSess()
    call mkdir(expand("~/.vim/sessions"), "p")
    mks! ~/.vim/sessions/last_sess.vim
endfunction

" auto save session on quit
" autocmd BufWinLeave *.* :call s:SaveCurSess()
" autocmd BufWritePre *.* :call s:SaveCurSess()
" autocmd BufWritePre *.* :call s:SaveCurSess()

""" jump to header
" Jump to a file whose extension corresponds to the extension of the current
" file. The `tags' file, created with:
" $ ctags --extra=+f -R .
" has to be present in the current directory.
function! JumpToCorrespondingFile()
    " let l:extensions = { 'c': 'h', 'h': 'c', 'cpp': 'hpp', 'hpp': 'cpp' }
    let l:extensions = { 'cpp': 'h', 'h': 'cpp' }
    let l:fe = expand('%:e')
    if has_key(l:extensions, l:fe)
        execute ':tag ' . expand('%:t:r') . '.' . l:extensions[l:fe]
    else
        call PrintError(">>> Corresponding extension for '" . l:fe . "' is not specified")
    endif
endfunct

" jump to a file with the corresponding extension (<C-F2> aka <S-F14>)
nnoremap <c-p> :call JumpToCorrespondingFile()<CR>
inoremap <c-p> <C-o>:call JumpToCorrespondingFile()<CR>

" Print error message.
function! PrintError(msg) abort
    execute 'normal! \<Esc>'
    echohl ErrorMsg
    echomsg a:msg
    echohl None
endfunction
""" end jump to header

""""""""""""""""""""""""""""""""""""""""
" fix issue with window scrolling during buffer switch
""""""""""""""""""""""""""""""""""""""""
" Save current view settings on a per-window, per-buffer basis.
function AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif

" Give user ability to lock session and prevent accidental quitting
function Lock()
  cnoremap <silent> q<CR> :call RejectQuit(0)<CR>
  cnoremap <silent> wq<CR> :call RejectQuit(1)<CR>
    echo("Session locked.")
endfu
function Unlock()
    cunmap q<CR>
    echo("Session unlocked.")
endfu

:command Lock :call Lock()
:command Unlock :call Unlock()

" reject quit when locked
function RejectQuit(writeFile)
    if (a:writeFile)
        if (expand('%:t')=="")
            echo "Can't save a file with no name."
            return
        endif
        :write
    endif

    if (winnr('$')==1 && tabpagenr('$')==1)
        echo("Session is locked; cannot quit. Run :Unlock to enable quitting.")
    endif
endfu

function CMakeTags()
  let l:build_dir = fnamemodify(finddir('build', system('git rev-parse --show-toplevel')[:-2], 1), ':p')
  let l:cmake_cache = findfile('CMakeCache.txt', build_dir, 1)
  call ParseCMakeCache(cmake_cache)
endfu

function ParseCMakeCache(cmake_cache)
  if !filereadable(a:cmake_cache)
    echo 'Error: cannot process CMakeCache.txt'
    return
  endif
  let l:lines = readfile(a:cmake_cache)
  for line in l:lines
    call ParseCMakeCacheLine(line)
  endfor
endfu

function ParseCMakeCacheLine(line)
  if type(a:line) != type('')
    echo 'Error: failed to parse CMakeCache.txt; got non-string line'
    return
  endif

  " return if the line is empty or a comment
  let l:line_len = strlen(a:line)
  if l:line_len == 0 || a:line[0] == ';' || a:line[0] == '#' || a:line[0:1] == '//'
    return
  endif

  " add tag if its a path with a build directory
  if match(a:line, '_DIR:PATH=') != -1 && match(a:line, 'build') != -1
    let l:build_pos = match(a:line, '/build')
    let l:eq_pos = match(a:line, '=')
    let l:build_dir = strpart(a:line, l:eq_pos+1)
    let l:parts = split(l:build_dir, '/build')
    let l:build_dir_parent = l:parts[0]
    let $tag_file = join([l:build_dir_parent, '.git/tags'], '/')
    :set tags+=$tag_file
  endif
endfu

" gitlab hooks
let g:fugitive_gitlab_domains = ['https://atas-gita.gtri.gatech.edu']

" vim-plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" Plugin outside ~/.vim/plugged with post-update hook
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-easy-align'
" tpope
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
" others
" Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ludovicchabant/vim-gutentags'
Plug 'inkarkat/vim-SyntaxRange'
Plug 'jceb/vim-orgmode'
Plug 'ekalinin/dockerfile.vim'
Plug 'morhetz/gruvbox'
Plug 'esquires/lvdb'

" Plug 'valloric/youcompleteme'

" vim-scripts is deprecated - need to find replacements
" Plug 'vim-scripts/utl.vim'

" Initialize plugin system
call plug#end()

" gruvbox is provided by a plugin and must be set after plugins are loaded
colorscheme gruvbox
