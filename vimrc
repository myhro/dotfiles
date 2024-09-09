" vim-plug
let vim_plug = expand($HOME . '/.vim/plug.vim')
if filereadable(vim_plug)
    execute('source ' . vim_plug)
    call plug#begin('~/.vim/plugged')
        " Plugins
        Plug 'airblade/vim-gitgutter'
        Plug 'dense-analysis/ale'
        Plug 'editorconfig/editorconfig-vim'
        Plug 'kien/ctrlp.vim'
        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-eunuch'
        Plug 'vim-airline/vim-airline'
        " Themes
        Plug 'altercation/vim-colors-solarized'
        Plug 'vim-airline/vim-airline-themes'
    call plug#end()
endif

" Disable mouse
set mouse=

" Disable backups
set nobackup
set noswapfile
set nowritebackup

" Disable viminfo
set viminfo=

" Replace tabs for spaces
set expandtab
set shiftwidth=4
set tabstop=4

" Indentation and syntax
filetype plugin indent on
set autoindent
syntax on

" Spell checking
set spell

" Viewing options, like cursor position and number of lines
set cursorline
set linebreak
set number
set ruler
set wildmenu

" Fix ESC delay
set ttimeoutlen=0

" Toggle hidden characters
map <silent> <C-m> :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" Navigation between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Navigation between tabs
map <Tab> gt
map <S-Tab> gT

" Search options
set hlsearch
set ignorecase
set incsearch
set smartcase

" Clear search results highlights
nmap <silent> <C-C> :silent noh<CR>

" File encoding
set encoding=utf-8

" Close preview window automatically
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Settings per plugin/theme
if isdirectory(expand($HOME . '/.vim/plugged/'))
    if isdirectory(expand($HOME . '/.vim/plugged/vim-colors-solarized/'))
        if has('gui_running')
            set background=light
        else
            set background=dark
        endif
        let g:solarized_termcolors=256
        set t_Co=256
        colorscheme solarized
        " Fix spell checker highlighting
        hi SpellBad cterm=underline
    endif

    if isdirectory(expand($HOME . '/.vim/plugged/ale/'))
        let g:ale_linters = {}
        call extend(g:ale_linters, {'c': []})
    endif

    if isdirectory(expand($HOME . '/.vim/plugged/ctrlp.vim/'))
        if executable('ag')
            let g:ctrlp_user_command = 'ag %s -g ""'
        endif
    endif

    if isdirectory(expand($HOME . '/.vim/plugged/vim-airline/'))
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_powerline_fonts = 1
        let g:airline_theme = 'powerlineish'
        set laststatus=2
    endif
endif
