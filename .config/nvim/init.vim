" Intalaciones previas:
" init.vim debe ir en ~/.config/nvim/init.vim
" y los pluggins en ~/.config/nvim/site/autoload/plug.vim
" instalar git, nodejs, yarn, python3
" pip install pynvim
" sudo npm i -g neovim
" sudo apt install ripgrep
set number
set mouse=a
set numberwidth=1
set clipboard=unnamedplus
syntax on
set showcmd
set ruler
set encoding=UTF-8
set showmatch
set sw=2
set relativenumber
highlight Normal ctermbg=NONE
set laststatus=2
set noshowmode

" Javascript
autocmd bufnewfile,bufread *.tsx set filetype=typescript.tsx
autocmd bufnewfile,bufread *.ts set filetype=typescript.tsx
autocmd bufnewfile,bufread *.jsx set filetype=javascript.jsx
autocmd bufnewfile,bufread *.js set filetype=javascript.jsx

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase  

" leader key
let mapleader = " "

call plug#begin('~/.vim/plugged')
  " Themes
  Plug 'morhetz/gruvbox'
  " IDE
  Plug 'yuezk/vim-js'
  Plug 'leafgarland/typescript-vim'
  Plug 'easymotion/vim-easymotion' " leader s
  Plug 'scrooloose/nerdtree' " leader nt
  Plug 'sheerun/vim-polyglot' " Reconocimiento de lenguajes
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'jiangmiao/auto-pairs' " Autocompleta llaves
  Plug 'tomtom/tcomment_vim' " Comantarios gcc o gc
  Plug 'yggdroot/indentline'
  Plug 'mattn/emmet-vim'
  " status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Old
  Plug 'ap/vim-css-color'
  Plug 'tpope/vim-surround'
  " New
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
  Plug 'ryanoasis/vim-devicons'
  Plug 'SirVer/ultisnips'
  Plug 'mlaursen/vim-react-snippets'

  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()

imap jj <Esc>

" Theme config
syntax enable
set termguicolors
colorscheme gruvbox 
set guicursor=

" Airline config
let g:airline_theme='badwolf'

" Tabline
let g:airline_stl_path_style = 'short'
let g:airline#extensions#fzf#enabled = 1
let g:airline_section_c_only_filename = 1
let g:airline#extensions#nerdtree_statusline = 1
let g:airline#extensions#coc#enabled = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0

" Easymotion config
nmap <leader>s <Plug>(easymotion-s2)
nmap <F6> ysiw)F x
nmap <F5> ciw<<Esc>pa></<Esc>pa><Esc>F>a

" macros
" let @p="ciw<\<Esc>pa></\<Esc>pa>\<Esc>F>a"

" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
nmap <leader>n :NERDTreeToggle<CR>

" FZF
nmap <C-p> :Files<CR>
nmap <leader>p :Rg<CR>

" Switch split
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Switch between tabs
nnoremap <leader>l gt
nnoremap <leader>h gT

" Coc nvim 
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-json', 'coc-html', 'coc-prettier', 'coc-snippets', 'coc-tslint-plugin', 'coc-tsserver', 'coc-styled-components', 'coc-sh', 'coc-eslint']
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
  \: "\<c-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gu <Plug>(coc-codeaction)
let g:coc_snippet_next = '<tab>'

" Prevent x from overriding what's in the clipboard
noremap x "_x
noremap X "_X

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Emmac with tab
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" let g:user_emmet_settings = {
"   \  'javascript.jsx' : {
"   \      'extends' : 'jsx',
"   \  },
"   \}

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
