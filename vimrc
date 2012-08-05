" Desabilitar o mouse:
set mouse=

" Desabilitar backups:
set nobackup
set noswapfile
set nowritebackup

" Desabilitar o viminfo:
set viminfo=

" Cores e tema:
filetype on
syntax on

" Tabs por espaços:
set expandtab
set shiftwidth=4
set tabstop=4

" Indentação:
filetype plugin indent on
set autoindent

" Régua, quebra e número de linhas:
set linebreak
set number
set ruler

" Navegação entre janelas:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Busca:
set hlsearch
set ignorecase
set incsearch
" Limpar os resultados destacados:
nmap <silent> <C-C> :silent noh<CR>

" Fonte e janela:
set encoding=utf-8
set wildmenu

" Omnicomplete:
inoremap <Nul> <C-x><C-o>
" Fechar automaticamente a janela de preview:
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
