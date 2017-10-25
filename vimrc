" Vundle
if isdirectory(expand($HOME . '/.vim/bundle/Vundle.vim/'))
    filetype off
    set nocompatible
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
        Plugin 'VundleVim/Vundle.vim'
        " Plugins
        Plugin 'airblade/vim-gitgutter'
        Plugin 'bling/vim-airline'
        Plugin 'fatih/vim-go'
        Plugin 'kien/ctrlp.vim'
        Plugin 'mattn/emmet-vim'
        Plugin 'plasticboy/vim-markdown'
        Plugin 'tpope/vim-commentary'
        Plugin 'tpope/vim-eunuch'
        Plugin 'w0rp/ale'
        " Themes
        Plugin 'altercation/vim-colors-solarized'
        Plugin 'vim-airline/vim-airline-themes'
    call vundle#end()
endif

" Desabilitar o mouse
set mouse=

" Desabilitar backups
set nobackup
set noswapfile
set nowritebackup

" Desabilitar o viminfo
set viminfo=

" Tabs por espaços
set expandtab
set shiftwidth=4
set tabstop=4

" Indentação e sintaxe
filetype plugin indent on
set autoindent
syntax on
" Por tipo de arquivo
au FileType yaml setl sw=2 ts=2 et

" Régua, quebra e número de linhas
set linebreak
set number
set ruler

" Indicador de posição do cursor
set cursorline

" Exibição de caracteres invisíveis
map <silent> <C-m> :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" Navegação entre janelas
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Navegação entre abas
map <Tab> gt
map <S-Tab> gT

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

" Configurações específicas dos plugins
if isdirectory(expand($HOME . '/.vim/bundle/Vundle.vim/'))
    if isdirectory(expand($HOME . '/.vim/bundle/vim-colors-solarized/'))
        if has('gui_running')
            set background=light
        else
            set background=dark
        endif
        let g:solarized_termcolors=256
        set t_Co=256
        colorscheme solarized
    endif

    if isdirectory(expand($HOME . '/.vim/bundle/ctrlp.vim/'))
        if executable('ag')
            let g:ctrlp_user_command = 'ag %s -g ""'
        endif
    endif

    if isdirectory(expand($HOME . '/.vim/bundle/vim-airline/'))
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_powerline_fonts = 1
        let g:airline_theme = 'powerlineish'
        set laststatus=2
    endif

    if isdirectory(expand($HOME . '/.vim/bundle/vim-markdown/'))
        let g:vim_markdown_folding_disabled=1
    endif
endif
