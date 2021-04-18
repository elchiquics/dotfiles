"       (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|

"Plugins{{{
call plug#begin('~/AppData/Local/nvim/plugged')

" firenvim
Plug 'glacambre/firenvim', {'do': {_ -> firenvim#install(0)}}

" For tags management
Plug 'ludovicchabant/vim-gutentags'

" CSV plugin
Plug 'chrisbra/csv.vim'

"Org-mode syntax highlighting
Plug 'axvr/org.vim'

"List <Leader> mappings
Plug 'ktonga/vim-follow-my-lead'

"Repeat commands
Plug 'tpope/vim-repeat'

"Visualize undotree
Plug 'mbbill/undotree'

"Tex shortcuts
Plug 'brennier/quicktex'

"Text formatter
Plug 'chiel92/vim-autoformat'

"Color rainbow brackets
Plug 'frazrepo/vim-rainbow'

"Themes
Plug 'ghifarit53/tokyonight-vim',  {'on' : 'colorscheme'}
Plug 'joshdick/onedark.vim',  {'on' : 'colorscheme'}
Plug 'junegunn/seoul256.vim',  {'on' : 'colorscheme'}
Plug 'morhetz/gruvbox',  {'on' : 'colorscheme'}
Plug 'whatyouhide/vim-gotham',  {'on' : 'colorscheme'}
Plug 'reedes/vim-colors-pencil',  {'on' : 'colorscheme'}
Plug 'axvr/photon.vim',  {'on' : 'colorscheme'}

"Focus writing
Plug 'junegunn/goyo.vim'

"TeX tools
Plug 'lervag/vimtex'

"Substitute & global visualization
Plug 'markonm/traces.vim'

"Calendar, diary & wiki
Plug 'mattn/calendar-vim'
Plug 'vimwiki/vimwiki',  {'branch' : 'dev'}

"Make comments
Plug 'preservim/nerdcommenter'

"Useful hightlight search
Plug 'romainl/vim-cool'

"Align text
Plug 'tommcdo/vim-lion'

"Git integration
Plug 'tpope/vim-fugitive',  {'on' : 'Git'}

"Quoting and parenthesis easy
Plug 'tpope/vim-surround'

"Restart vim
Plug 'tyru/restart.vim',  {'on' : 'Restart'}

"ViFM integration
Plug 'vifm/vifm.vim'

"Move cells or arguments
Plug 'elchiquics/sideways.vim'

"Smart i_C-Y and i_C-E
Plug 'emugel/vim-ictrlye'

"vim airline
Plug 'vim-airline/vim-airline'

"vim devicons
Plug 'ryanoasis/vim-devicons'

call plug#end()

"}}}
"Variables{{{

let g:netrw_banner                        = 0
let g:airline_powerline_fonts             = 1
let g:netrw_browse_split                  = 4
let g:netrw_fastbrowse                    = 0
let g:netrw_liststyle                     = 3
let g:netrw_winsize                       = 20
let g:rainbow_active                      = 1
let g:tex_conceal_frac                    = 1
let g:tex_conceal                         ="abdgms"
let g:tex_flavor                          ="latex"
let g:tex_subscripts                      ="[0-9aehijklmnoprstuvx,+-/().]"
let g:tex_superscripts                    ="[0-9a-zA-W.,:;+-<>/()=]"
let g:vimtex_view_general_viewer          ="SumatraPDF"
let mapleader                             =" "
let maplocalleader                        =" "
let g:vimtex_compiler_latexmk_engines     = {
      \ '_': '-pdflatex',
\}
let g:vimtex_quickfix_ignore_filters      = [
      \ 'LaTeX Font Warning',
      \ 'Overfull',
      \ 'Underfull',
      \ 'Package babel Warning',
      \ 'only floats',
\]

let g:quicktex_tex                        = {
      \ ' '   : "\<ESC>/<+.*+>\<CR>\"_c/+>/e\<CR>",
      \ 'ite' : "\\item ",
      \ 'img' : "\\includegraphics[width=0.8\linewidth]{<+++>} <++>",
      \ 'fig' : "\\begin{figure}[bh]\<CR>\centering\<CR><+++>\<CR>\\end{figure}",
      \ 'im'  : "\\(<+++> \\) <++>",
      \ 'eq'  : "\\begin{equation}\<CR><+++>\<CR>\\end{equation}\<CR><++>",
      \ 'sp'  : "\\begin{split}\<CR><+++>\<CR>\\end{split}",
      \ 'gat' : "\\begin{gather}\<CR><+++>\<CR>\\end{gather}\<CR><++>",
      \ 'ali' : "\\begin{align}\<CR><+++>\<CR>\\end{align}\<CR><++>",
      \ 'bf'  : "\\textbf{<+++>} <++>",
      \ 'it'  : "\\textit{<+++>} <++>",
      \ 'tt'  : "\\texttt{<+++>} <++>",
      \ 'sec' : "\\section{<+++>}",
      \ 'sub' : "\\subsection{<+++>}",
      \}

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
      \ 'set'   : "\\{<+++> \\} <++>",
      \ 'lrp'   : "\\left(<+++> \\right) <++>",
      \ 'lrb'   : "\\left[<+++> \\right] <++>",
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
      \ '..'    : ", \\ldots,  ",
      \ 'max'   : "\\max\\{<+++> \\} <++>",
      \ 'min'   : "\\min\\{<+++> \\} <++>",
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
      \}

"}}}
"Options{{{

set autochdir
set noshowmode
set autowrite
set expandtab
set hlsearch
set ignorecase
set incsearch
set nobackup
set noerrorbells
set noswapfile
set number
set relativenumber
set splitbelow
set splitright
set termguicolors
set undofile

set background   =dark
set backspace    =2
set belloff      =all
set cmdheight    =2
set conceallevel =2
set encoding     =utf-8
set fileencoding =utf-8
set foldmethod   =marker
set path         =~/Desktop/
set path        +=~/Downloads/
set path        +=~/Documents/todos/
set shiftwidth   =2
set undodir      =~/vimfiles/undodir/
set shortmess    =at
set tabstop      =2
set guifont=SauceCodePro\ Nerd\ Font\ Mono:h14

"}}}
"Autocommands{{{

"Use q to close netrw
autocmd FileType netrw nnoremap <buffer> <silent> q :bdelete<CR>

"Mappings for help files
autocmd FileType help nnoremap <buffer> <silent> q :bdelete<CR>

"TextWith for vimwiki
autocmd FileType vimwiki set textwidth=80

"Kanban press q to quit window
autocmd BufRead kanban.wiki nnoremap <buffer> <silent> q :bdelete<CR>

"TeX Template
autocmd BufNewFile *.tex 0r ~/vimfiles/templates/template.tex

"Markdown to PDF map
autocmd FileType markdown nnoremap <Leader>ll :call PandocToPDF()<CR>

"}}}
"Mappings{{{

" Source the dotfiles
nnoremap <Leader>, :source ~/AppData/Local/nvim/init.vim<CR>

"Edit .vimrc in new tab
nnoremap <Leader>o :tabe ~/AppData/Local/nvim/init.vim<CR>

"Paste from system clipboard
nnoremap <Leader>p "+p

"Yank to system clipboard
nnoremap <Leader>y "+y

"Coherent behavior of Y
nnoremap Y y$

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

"Move lines above or down
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==

"Put hour
nnoremap <Leader>H "=strftime("%H:%M")<CR>P

"Put date
nnoremap <Leader>D "=strftime("%d de %b del %Y")<CR>P

"Insert on VimWiki hour
inoremap <F6> = <C-R>=strftime("%H:%M")<CR> =<CR>

"Insert on VimWiki date
inoremap <F5> = <C-R>=strftime("%d de %b del %Y") =<CR>

"Move between buffers
nnoremap [f :bprevious<CR>
nnoremap]f :bnext<CR>

"Move arguments with sideways.vim
nnoremap <C-Right> :SidewaysRight<CR>
nnoremap <C-Left>  :SidewaysLeft<CR>

"}}}
"Misc Options{{{

colorscheme photon
syntax enable
filetype plugin on

"}}}
"Functions{{{

"Copy matches{{{
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)
"}}}

"Schoolar Schedule{{{
function! ShowSchedule()
  execute 'split ~/vimwiki/horario.wiki'
  nnoremap <buffer><silent> q :bdelete<CR>
endfunction
"}}}

"Format Math and Text TeX{{{
function! FormatText()
  %s/, /, /ge | %s/,  /, /ge
  %s/\s\+$//ge
  %s/\(\w\)\n\(\\begin{.*}\)/\1\2/ge
  %s/\(\\end{.*}\)\n\(\w\)/\1\2/ge
  %s/\(\(\\\)\?\(left\)\?[({[]\)\s\+/\1/ge
  %s/\s\+\(\(\\\)\?\(right\)\?[)}\]]\)/\1/ge
endfunction
"}}}

" Markdown -> Pandoc -> LaTeX -> PDF{{{
function! PandocToPDF()
  silent execute '!pandoc -f markdown -t pdf % -o ' . expand('%:r') . '.pdf'
  silent execute '!mupdf ' . expand('%:r') . '.pdf'
endfunction
"}}}
"}}}
"Firenvim config{{{
if exists('g:started_by_firenvim')
  set laststatus=0
else
  set laststatus=2
endif
"}}}
