call pathogen#infect()

"auto reload vimrc
autocmd! bufwritepost .vimrc source %

"F2 as easier paste
set pastetoggle=<F2>
set clipboard=unnamed

"normal backspace and use mouse
set bs=2
set mouse=r

"accept capital letters as some commands
:command! W w
:command! Q q
:command! Sh sh
:command! SH sh

"leader key is now ,
let mapleader = ","

"highlight search, ctrl+n to hide
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

"ctrl+z = save file
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

",e exit file, ,E exit vim
noremap <Leader>e :quit<CR>
noremap <Leader>E :qa!<CR>

"ctrl+j/k/l/h switch windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

",n next tab
",m prev tab
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

"easier block move just < and >
vnoremap < <gv
vnoremap > >gv

"highlight unnecessary white spaces
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

"syntax highlighting based on file type
filetype off
filetype plugin indent on
syntax on

"Show relative line numbers, but on current line show absolute number
set relativenumber
set number

"show columns  etc.
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233

"history and undo depth
set history=700
set undolevels=700

"no tabs, just spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

"highlight search, case sensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

"no trash ~ files
set nobackup
set nowritebackup
set noswapfile

"powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
set background=dark
colorscheme molokai

"ClangFormat - auto format on buffer write
autocmd FileType c,cpp,objc ClangFormatAutoEnable
let g:clang_format#style_options = {
            \ "BasedOnStyle" : "Mozilla",
            \ "BreakBeforeBraces" : "Allman",
            \ "IndentWidth" : "4",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
