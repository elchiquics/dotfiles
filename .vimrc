"       (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|

"Plugins{{{
call plug#begin('~\vimfiles\plugged')

Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

Plug 'SirVer/ultisnips'
Plug 'chiel92/vim-autoformat'
Plug 'easymotion/vim-easymotion'
Plug 'frazrepo/vim-rainbow'
Plug 'ghifarit53/tokyonight-vim'
Plug 'freitass/todo.txt-vim'
Plug 'junegunn/seoul256.vim'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'joshdick/onedark.vim'
Plug 'lervag/vimtex'
Plug 'markonm/traces.vim'
Plug 'morhetz/gruvbox'
Plug 'pbrisbin/vim-mkdir'
Plug 'plasticboy/vim-markdown'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'romainl/vim-cool'
Plug 'takac/vim-hardtime'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-surround'
Plug 'tranvansang/octave.vim'
Plug 'uiiaoo/java-syntax.vim'
Plug 'vifm/vifm.vim'

call plug#end()

"}}}
"Variables{{{

let g:UltiSnipsExpandTrigger      ='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsJumpForwardTrigger ='<tab>'
let g:rainbow_active              = 1
let g:tex_conceal                 ="abdgms"
let g:tex_conceal_frac            =1
let g:tex_flavor                  ="latex"
let g:tex_subscripts              ="[0-9aehijklmnoprstuvx,+-/().]"
let g:tex_superscripts            ="[0-9a-zA-W.,:;+-<>/()=]"
let g:vimtex_view_general_viewer  ="SumatraPDF"
let mapleader                     =" "
let maplocalleader                =" "
let g:vimtex_quickfix_ignore_filters = [
      \ 'LaTeX Font Warning',
      \ 'Package babel Warning',
      \ 'Overfull',
      \]

"}}}
"Options{{{

set autochdir
set termguicolors
set background  =dark
set backspace   =2
set backup
set backupdir   =~/vimfiles/files/backup
set cmdheight   =2
set conceallevel=2
set directory   =~/vimfiles/files/swapdir
set encoding    =utf-8
set expandtab
set fileencoding=utf-8
set foldmethod  =marker
set hlsearch
set incsearch
set nocompatible
set noerrorbells
set path        =.,~/Documents/,~/Documents/TeX/*/
set path       +=~/Desktop/
set path       +=~/Documents/TeX/*/*/,~/Documents/todos/
set path       +=~/Downloads/,~/Documents/C/
set renderoptions=type:directx
set shiftwidth  =2
set shortmess   =at
set t_Co        =256
set tabstop     =2
set termguicolors
set undodir     =~/vimfiles/undodir
set undofile
set updatecount =100
set updatetime  =50
set wrap

"}}}

autocmd BufNewFile *.tex 0r ~/vimfiles/templates/textemplate.tex
autocmd FileType asy set smartindent
autocmd FileType c nnoremap <F5> :call CompileCRun()<CR>
autocmd FileType cpp nnoremap <Leader>C :call ClearCPP()<CR>
autocmd FileType cpp nnoremap <Leader>m :call MakeRunCPP()<CR>
autocmd FileType cpp set errorformat+=%f:%l:\ %m
autocmd FileType cpp set makeprg=g++\ %\ -o\ %<.exe
autocmd FileType haskell nnoremap <F5> :!ghci %
autocmd FileType haskell nnoremap <Leader>m :!ghci %<CR>
autocmd FileType haskell set makeprg=ghc\ %\ -o\ %<.exe
autocmd FileType java nnoremap <Leader>ll :call Java_Run()<CR>
autocmd FileType markdown nnoremap <Leader>ll :call PandocToPDF()<CR>
autocmd FileType python nnoremap <Leader>r :!pypy3 %<CR>
autocmd FileType rust nnoremap <Leader>ll :call CompileAndRunRust()<CR>
autocmd FileType tex nnoremap <C-x><C-a> :call Run_Arara()<CR>
autocmd FileType,BufWritePre .vimrc call TrimTrailingWhitespaces()

"Mappings{{{

inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
inoremap <C-b> <C-n>
inoremap <C-l> <C-p>
map <LocalLeader> <Plug>(easymotion-prefix)
nnoremap <A-f> :NERDTree<CR>
nnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
nnoremap <C-x>c :PlugClean<CR>
nnoremap <C-x>i :PlugInstall<CR>
nnoremap <C-x>u :PlugUpdate<CR>
nnoremap <F2> :HardTimeToggle<CR>
nnoremap <F3> :Autoformat<CR>
nnoremap <Leader>, :source ~/.vimrc<CR>
nnoremap <Leader>B O<Esc>k
nnoremap <Leader>M :make<CR>
nnoremap <Leader>O :tabe ~/.gvimrc<CR>
nnoremap <Leader>b o<Esc>j
nnoremap <Leader>c :close!<CR>
nnoremap <Leader>o :tabe ~/.vimrc<CR>
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>t :tabe<CR>
nnoremap <Leader>w :w!<CR>
nnoremap Y y$
nnoremap [f :bnext<CR>
nnoremap ]f :bprevious<CR>
nnoremap ga <Plug>(EasyAlign)
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
xmap ga <Plug>(EasyAlign)

"}}}
"Misc Options{{{

colorscheme shades_of_purple
syntax enable
filetype plugin on

"}}}
"Functions{{{
" Se usa de la siguiente manera
" Esta opcion hace que el registro 'a' este vacio
" :let @a = ''
" :bufdo CopyMatches <Registro>

" Copy Matches{{{
function! CopyMatches(reg)
  let hits=[]
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg=empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.'=join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)
"}}}
" Run Java Code{{{
function! Java_Run()
  silent execute '!javac ' . shellescape(expand('%'))
  execute '!java '   . expand('%:r')
endfunction
"}}}
" Run Arara{{{
function! Run_Arara()
  silent execute '!arara ' . expand('%:r')
  silent execute '!mupdf ' . expand('%:r') . '.pdf'
endfunction
"}}}
" Markdown -> Pandoc -> LaTeX -> PDF{{{
function! PandocToPDF()
  silent execute '!pandoc -f markdown -t pdf % -o ' . expand('%:r') . '.pdf'
  silent execute '!mupdf ' . expand('%:r') . '.pdf'
endfunction
"}}}
"Trim Trailing White Spaces{{{
function! TrimTrailingWhitespaces()
  silent execute ':%s/\s\+$//e'
endfunction
"}}}
" Run Python Code{{{
function! PythonCode()
 execute '!python %'
endfunction
autocmd FileType python nnoremap <F5> :call PythonCode()<CR>
" }}}
"Run Asymptote{{{
function! RunAsy()
  silent execute '!asy -f pdf %'
endfunction
autocmd FileType *.asy nnoremap <F5> :call RunAsy()<CR>
"}}}
"Compile C and Run{{{
function! CompileCRun()
  silent execute '!gcc % -o ' . expand('%:r')
  execute '!' . expand('%:r')
endfunction
"}}}
"Compile C++ and run{{{
function! MakeRunCPP()
  "silent execute '!g++ % -o ' . expand('%:r')
  execute '!' . expand('%:r')
endfunction
function ClearCPP()
  silent execute '!rm -f *.exe'
  echo 'Executables erased!'
endfunction

"}}}
function! CompileAndRunRust()
  silent execute '!rustc %'
  execute '!' . expand('%:r') . '.exe'
endfunction
"}}}
