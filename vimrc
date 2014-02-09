" Pathogen
if filereadable(expand($HOME . "/.vim/autoload/pathogen.vim"))
    execute pathogen#infect()
endif

" Desabilitar o mouse
set mouse=

" Desabilitar backups
set nobackup
set noswapfile
set nowritebackup

" Desabilitar o viminfo
set viminfo=

" Clipboard do sistema
if version >= 703
    set clipboard=unnamed
endif

" Cores e tema
filetype on
syntax on

" Tabs por espaços
set expandtab
set shiftwidth=4
set tabstop=4

" Indentação
filetype plugin indent on
set autoindent

" Régua, quebra e número de linhas
set linebreak
set number
set ruler

" Indicadores de posição do cursor
set cursorline
set cursorcolumn

" Navegação entre janelas
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Navegação entre abas
map <Tab> gt
map <S-Tab> gT

" Salvar com CTRL + S
map <C-s> :w<CR>

" Busca
set hlsearch
set ignorecase
set incsearch

" Limpar os resultados destacados
nmap <silent> <C-C> :silent noh<CR>

" Fonte e janela
set encoding=utf-8
set wildmenu

" Omnicomplete
inoremap <Nul> <C-x><C-o>

" Fechar automaticamente a janela de preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Configurações do Solarized
if isdirectory(expand($HOME . "/.vim/bundle/vim-colors-solarized/"))
    if has('gui_running')
        set background=light
    else
        set background=dark
    endif
    let g:solarized_termcolors=256
    set t_Co=16
    colorscheme solarized
endif
