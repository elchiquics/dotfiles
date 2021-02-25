"       (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|

"Plugins{{{
call plug#begin('~\vimfiles\plugged')

Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'mattn/calendar-vim'
Plug 'SirVer/ultisnips'
Plug 'chiel92/vim-autoformat'
Plug 'frazrepo/vim-rainbow'
Plug 'freitass/todo.txt-vim'
Plug 'junegunn/goyo.vim'
Plug 'lervag/vimtex'
Plug 'markonm/traces.vim'
Plug 'preservim/nerdcommenter'
Plug 'reedes/vim-colors-pencil'
Plug 'romainl/vim-cool'
Plug 'takac/vim-hardtime'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tyru/restart.vim'
Plug 'vifm/vifm.vim'
Plug 'vimwiki/vimwiki'

call plug#end()

"}}}
"Variables{{{

let g:UltiSnipsExpandTrigger              ='<tab>'
let g:UltiSnipsJumpBackwardTrigger        ='<s-tab>'
let g:UltiSnipsJumpForwardTrigger         ='<tab>'
let g:netrw_banner                        = 0
let g:netrw_browse_split                  = 4
let g:netrw_fastbrowse                    = 0
let g:netrw_liststyle                     = 3
let g:netrw_winsize                       = 20
let g:rainbow_active                      = 1
let g:tex_conceal                         ="abdgms"
let g:tex_conceal_frac                    =1
let g:tex_flavor                          ="latex"
let g:tex_subscripts                      ="[0-9aehijklmnoprstuvx,+-/().]"
let g:tex_superscripts                    ="[0-9a-zA-W.,:;+-<>/()=]"
let g:vimtex_view_general_viewer          ="SumatraPDF"
let mapleader                             =" "
let maplocalleader                        =" "
let g:vimtex_view_general_options
                \                         = '-reuse-instance -forward-search @tex @line @pdf'
                \ . ' -inverse-search "' . exepath(v:progpath)
                \ . ' --servername ' . v:servername
                \ . ' --remote-send \"^<C-\^>^<C-n^>'
                \ . ':execute ''drop '' . fnameescape(''\%f'')^<CR^>'
                \ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
                \ . ':call remote_foreground('''.v:servername.''')^<CR^>^<CR^>\""'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:vimtex_quickfix_ignore_filters      = [
      \ 'LaTeX Font Warning',
      \ 'Package babel Warning',
      \ 'Overfull',
      \ 'only floats',
      \]

"}}}
"Options{{{

set autochdir
set relativenumber
set ignorecase
set background  =light
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
set path       +=~/Documents/todos/
set path       +=~/Downloads/
set renderoptions=type:directx
set shiftwidth  =2
set shortmess   =at
set splitbelow
set splitright
set t_Co        =256
set tabstop     =2
set termguicolors
set termguicolors
set undodir     =~/vimfiles/undodir
set undofile
set updatecount =100
set updatetime  =50
set wrap

"}}}
"Autocommands{{{
autocmd FileType vimwiki set textwidth=80
autocmd BufNewFile *.tex 0r ~/vimfiles/templates/textemplate.tex
autocmd FileType java nnoremap <Leader>ll :call Java_Run()<CR>
autocmd FileType markdown nnoremap <Leader>ll :call PandocToPDF()<CR>
"}}}
"Mappings{{{

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
inoremap <C-b> <C-n>
inoremap <C-l> <C-p>
map <LocalLeader> <Plug>(easymotion-prefix)
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
nnoremap <A-f> :NERDTree<CR>
nnoremap <C-x>c :PlugClean<CR>
nnoremap <C-x>i :PlugInstall<CR>
nnoremap <C-x>u :PlugUpdate<CR>
nnoremap <F2> :HardTimeToggle<CR>
nnoremap <F3> :Autoformat<CR>
nnoremap <F6> "=strftime("%H:%M")<CR>P
inoremap <F6> = <C-R>=strftime("%H:%M")<CR> =<CR>
nnoremap <F5> "=strftime("%y de %b del %Y")<CR>P
inoremap <F5> <C-R>=strftime("%y de %b del %Y")<CR>
nnoremap <Leader>, :source ~/.vimrc<CR>
nnoremap <Leader>B O<Esc>k
nnoremap <Leader>M :make<CR>
nnoremap <Leader>O :tabe ~/.gvimrc<CR>
nnoremap <Leader>b o<Esc>j
nnoremap <Leader>c :close!<CR>
nnoremap <Leader>o :tabe ~/.vimrc<CR>
nnoremap <Leader>p "+p
nnoremap <Leader>t :tabe<CR>
nnoremap <Leader>y "+y
nnoremap Y y$
nnoremap [f :bnext<CR>
nnoremap ]f :bprevious<CR>
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

"}}}
"Misc Options{{{

colorscheme gruvbox
syntax enable
filetype plugin on

"}}}
"Functions{{{
" Copy Matches{{{
function! CopyMatches(reg)
  let hits=[]
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg=empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.'=join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)
"}}}
" Markdown -> Pandoc -> LaTeX -> PDF{{{
function! PandocToPDF()
  silent execute '!pandoc -f markdown -t pdf % -o ' . expand('%:r') . '.pdf'
  silent execute '!mupdf ' . expand('%:r') . '.pdf'
endfunction
"}}}
" Run Python Code{{{
function! PythonCode()
 execute '!python %'
endfunction
autocmd FileType python nnoremap <F5> :call PythonCode()<CR>
" }}}
"}}}
