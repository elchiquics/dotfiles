"       (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|

"Plugins{{{
call plug#begin('~\vimfiles\plugged')

"Tex shortcuts
Plug 'brennier/quicktex'

"Text formatter
Plug 'chiel92/vim-autoformat'

"Color rainbow brackets 
Plug 'frazrepo/vim-rainbow'

"Themes
Plug 'ghifarit53/tokyonight-vim'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'whatyouhide/vim-gotham'
Plug 'reedes/vim-colors-pencil'

"Focus writing
Plug 'junegunn/goyo.vim'

"TeX tools
Plug 'lervag/vimtex'

"Substitute & global visualization
Plug 'markonm/traces.vim'

"Calendar, diary & wiki
Plug 'mattn/calendar-vim'
Plug 'vimwiki/vimwiki'

"Make comments
Plug 'preservim/nerdcommenter'

"Useful hightlight search
Plug 'romainl/vim-cool'

"Improving vim use
Plug 'takac/vim-hardtime'

"Align text
Plug 'tommcdo/vim-lion'

"Git integration
Plug 'tpope/vim-fugitive'

"Quoting and parenthesis easy
Plug 'tpope/vim-surround'

"Restart vim, like emacs
Plug 'tyru/restart.vim'

"ViFM integration
Plug 'vifm/vifm.vim'

call plug#end()

"}}}
"Variables{{{

let g:hardtime_default_on                 = 1
let g:netrw_banner                        = 0
let g:netrw_browse_split                  = 4
let g:netrw_fastbrowse                    = 0
let g:netrw_liststyle                     = 3
let g:netrw_winsize                       = 20
let g:rainbow_active                      = 1
let g:tex_conceal_frac                    =1
let g:tex_conceal                         ="abdgms"
let g:tex_flavor                          ="latex"
let g:tex_subscripts                      ="[0-9aehijklmnoprstuvx,+-/().]"
let g:tex_superscripts                    ="[0-9a-zA-W.,:;+-<>/()=]"
let g:vimtex_view_general_viewer          ="SumatraPDF"
let mapleader                             =" "
let maplocalleader                        =" "
let g:vimtex_compiler_latexmk_engines     = {
                                          \ '_': '-xelatex',
                                          \}
let g:vimtex_quickfix_ignore_filters      = [
                                          \ 'LaTeX Font Warning',
                                          \ 'Overfull',
                                          \ 'Package babel Warning',
                                          \ 'only floats',
                                          \]

let g:quicktex_tex                        = {
                                          \ ' '   : "\<ESC>/<+.*+>\<CR>\"_c/+>/e\<CR>",
                                          \ 'ite' : "\\item ",
                                          \ 'img' : "\\includegraphics[width=0.8\linewidth]{<+++>} <++>",
                                          \ 'fig' : "\\begin{figure}[bh]\<CR>\centering\<CR><+++>\<CR>\\end{figure}",
                                          \ 'im'  : "\\( <+++> \\) <++>",
                                          \ 'eq'  : "\\begin{equation}\<CR><+++>\<CR>\\end{equation}\<CR><++>",
                                          \ 'sp'  : "\\begin{split}\<CR><+++>\<CR>\\end{split}",
                                          \ 'gat' : "\\begin{gather}\<CR><+++>\<CR>\\end{gather}\<CR><++>",
                                          \ 'ali' : "\\begin{align}\<CR><+++>\<CR>\\end{align}\<CR><++>",
                                          \ 'bf'  : "\\textbf{<+++>} <++>",
                                          \ 'it'  : "\\textit{<+++>} <++>",
                                          \ 'tt'  : "\\texttt{<+++>} <++>",
                                          \ 'sec' : "\\section{<+++>}",
                                          \ 'sub' : "\\subsection{<+++>}",
                                          \ }

let g:quicktex_math                       = {
                                          \ ' '     :  "\<ESC>/<+.*+>\<CR>\"_c/+>/e\<CR>",
                                          \ 'in'    : "\\in ",
                                          \ 'Lim'   : "\\lim ",
                                          \ 'lim'   : "\\lim_{<+++>} <++>",
                                          \ 'imp'   : "\\implies ",
                                          \ 'iff'   : "\\iff ",
                                          \ 'cap'   : "\\cap ",
                                          \ 'cup'   : "\\cup ",
                                          \ 'st'    : ": ",
                                          \ 'fa'    : "\\forall ",
                                          \ 'frac'  : "\\frac{<+++>}{<++>} <++>",
                                          \ 'set'   : "\\{ <+++> \\} <++>",
                                          \ 'lrp'   : "\\left( <+++> \\right) <++>",
                                          \ 'lrb'   : "\\left[ <+++> \\right] <++>",
                                          \ 'norm'  : "\\parallel <+++> \\parallel <++>",
                                          \ 'abs'   : "\\abs{<+++>} <++>",
                                          \ 'inf'   : "\\infty",
                                          \ 'Rn'    : "\\mathbb{R}^n ",
                                          \ 'Re'    : "\\mathbb{R}^n ",
                                          \ 'Na'    : "\\mathbb{N} ",
                                          \ 'In'    : "\\mathbb{Z} ",
                                          \ 'Ra'    : "\\mathbb{Q} ",
                                          \ 'serie' : "\\sum_{n=0}^{\\infty} ",
                                          \ 'to'    : "\\mapsto ",
                                          \ 'sqrt'  : "\\sqrt{<+++>} <++>",
                                          \ 'l.'    : "\\ldots ",
                                          \ 'c.'    : "\\cdots ",
                                          \ 'v.'    : "\\vdots ",
                                          \ 'd.'    : "\\ddots ",
                                          \ '..'    : ",\\ldots, ",
                                          \ 'max'   : "\\max\\{ <+++> \\} <++>",
                                          \ 'min'   : "\\min\\{ <+++> \\} <++>",
                                          \ 'leq'   : "\\leq ",
                                          \ 'geq'   : "\\geq ",
                                          \ 'int'   : "\\int_{<+++>}^{<++>} <++> \dif <++>",
                                          \ 'Int'   : "\\int <+++> \dif <++>",
                                          \ 'dif'   : "\\od{<+++>}{<++>} <++>",
                                          \ 'pd'    : "\\pd{<+++>}{<++>} <++>",
                                          \ 'sum'   : "\\sum_{<+++>}^{<++>} <++>",
                                          \ 'Sum'   : "\\sum ",
                                          \ 'Prod'  : "\\prod_{<+++>}^{<++>} <++>",
                                          \ 'prod'  : "\\prod ",
                                          \ 'alp'   : "\\alpha ",
                                          \ 'bet'   : "\\beta ",
                                          \ 'gam'   : "\\gamma ",
                                          \ 'del'   : "\\delta ",
                                          \ 'eps'   : "\\epsilon ",
                                          \ 'zet'   : "\\zeta ",
                                          \ 'eta'   : "\\eta ",
                                          \ 'the'   : "\\theta ",
                                          \ 'iot'   : "\\iota ",
                                          \ 'kap'   : "\\kappa ",
                                          \ 'mu'    : "\\mu ",
                                          \ 'nu'    : "\\nu ",
                                          \ 'xi'    : "\\xi ",
                                          \ 'omi'   : "\\omicron ",
                                          \ 'pi'    : "\\pi ",
                                          \ 'rho'   : "\\rho ",
                                          \ 'sig'   : "\\sigma ",
                                          \ 'tau'   : "\\tau ",
                                          \ 'ups'   : "\\upsilon ",
                                          \ 'phi'   : "\\phi ",
                                          \ 'chi'   : "\\chi ",
                                          \ 'psi'   : "\\psi ",
                                          \ 'ome'   : "\\omega ",
                                          \ 'Alp'   : "\\Alpha ",
                                          \ 'Bet'   : "\\Beta ",
                                          \ 'Gam'   : "\\Gamma ",
                                          \ 'Del'   : "\\Delta ",
                                          \ 'Eps'   : "\\Epsilon ",
                                          \ 'Zet'   : "\\Zeta ",
                                          \ 'Eta'   : "\\Eta ",
                                          \ 'The'   : "\\Theta ",
                                          \ 'Iot'   : "\\Iota ",
                                          \ 'Kap'   : "\\Kappa ",
                                          \ 'Mu'    : "\\Mu ",
                                          \ 'Nu'    : "\\Nu ",
                                          \ 'Xi'    : "\\Xi ",
                                          \ 'Omi'   : "\\Omicron ",
                                          \ 'Pi'    : "\\Pi ",
                                          \ 'Rho'   : "\\Rho ",
                                          \ 'Sig'   : "\\Sigma ",
                                          \ 'Tau'   : "\\Tau ",
                                          \ 'Ups'   : "\\Upsilon ",
                                          \ 'Phi'   : "\\Phi ",
                                          \ 'Chi'   : "\\Chi ",
                                          \ 'Psi'   : "\\Psi ",
                                          \ 'Ome'   : "\\Omega ",
                                          \ }

"}}}
"Options{{{

set autochdir
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
set ignorecase
set incsearch
set nocompatible
set noerrorbells
set path        =~/Documents/,~/Documents/TeX/*/
set path       +=~/Desktop/
set path       +=~/Documents/todos/
set path       +=~/Downloads/
set relativenumber
set renderoptions=type:directx
set shiftwidth  =2
set shortmess   =at
set splitbelow
set splitright
set t_Co        =256
set tabstop     =2
set termguicolors
set undodir     =~/vimfiles/undodir
set undofile
set belloff     =all

"}}}
"Autocommands{{{
"TextWith for vimwiki
autocmd FileType vimwiki set textwidth=80

"Move Cells for kanban
autocmd BufRead kanban.wiki nnoremap <C-Right> T\|vt\|ygvr<Space>f\|a<C-R>0<Esc>
autocmd BufRead kanban.wiki nnoremap <C-Left> T\|vt\|ygvr<Space>F\|i<C-R>0<Esc>

"VimWiki template
autocmd BufNewFile ~/vimwiki/diary/*.wiki 0r ~/vimfiles/templates/template.wiki

"TeX Template
autocmd BufNewFile *.tex 0r ~/vimfiles/templates/template.tex

"Markdown to PDF map
autocmd FileType markdown nnoremap <Leader>ll :call PandocToPDF()<CR>
"}}}
"Mappings{{{

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Abre KanBan
nnoremap <Leader>wk :e! ~/vimwiki/kanban.wiki<CR>

"Move lines above or down
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==

"Put date or hour
nnoremap <F6> "=strftime("%H:%M")<CR>P
nnoremap <F5> "=strftime("%d de %b del %Y")<CR>P

"Insert on VimWiki date or hour
inoremap <F6> = <C-R>=strftime("%H:%M")<CR> =<CR>
inoremap <F5> = <C-R>=strftime("%d de %b del %Y") =<CR>

" Source the dotfiles
nnoremap <Leader>, :source ~/.vimrc<CR>

nnoremap <Leader>O :tabe ~/.gvimrc<CR>
nnoremap <Leader>c :close!<CR>
nnoremap <Leader>o :tabe ~/.vimrc<CR>
nnoremap <Leader>p "+p
nnoremap <Leader>t :tabe<CR>
nnoremap <Leader>y "+y
nnoremap Y y$

"Move between buffers
nnoremap [f :bnext<CR>
nnoremap ]f :bprevious<CR>

"}}}
"Misc Options{{{

colorscheme seoul256-light
syntax enable
filetype plugin on

"}}}
"Functions{{{
" Label Tex{{{
function! LabelTex(start,end)
  for i in range(a:start,a:end)
    silent execute 'normal gg/:figlabel:ci}fig:' . i
  endfor
endfunction
"}}}
"Format Math and Text TeX{{{
function! FormatTex()
  let title = input("Título: ")
  let date = strftime("%d de %b del %Y")
  silent execute '%s/:date:/' . date . '/e'
  silent execute '%s/:title:/' . title . '/e'
  silent execute '%s/ \?\([*+-]\) \?/\1/ge'
  silent execute '%s/\([({]\) \?/\1/ge'
  silent execute '%s/ \?\([}]\) \?/\1/ge'
  silent execute '%s/ ,/, /ge'
  silent execute '%s/ , /, /ge'
  silent execute '%s/\s\+$//ge'
  silent execute '%s/\(\w\)\n\(\\begin{.*}\)/\1\2/ge'
  silent execute '%s/\(\\end{.*}\)\n\(\w\)/\1\2/ge'
endfunction
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
"Abbrevations{{{
iabbrev :name: García Bernal Axel
"}}}
