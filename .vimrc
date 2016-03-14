map  <Left>  <nop>
map  <Right> <nop>
map  <Up>   <nop>
map  <Down> <nop>

filetype plugin indent on
syntax on

set expandtab
set tabstop=2
set shiftwidth=2
set hlsearch
set incsearch
set relativenumber
set number

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'editorconfig/editorconfig-vim'
Plug 'flazz/vim-colorschemes'
Plug 'pmsorhaindo/syntastic-local-eslint.vim'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

let syntastic_javascript_checkers = ['jscs', 'eslint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

let g:syntastic_aggregate_errors = 1

command! -nargs=1 V :vim <args> src/**/*.*

set t_Co=256
set background=dark

let g:solarized_termcolors = 256
colorscheme solarized

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules)',
  \ }

nnoremap <Leader>j :m .+1<CR>==
nnoremap <Leader>k :m .-2<CR>==
inoremap <Leader>j <Esc>:m .+1<CR>==gi
inoremap <Leader>k <Esc>:m .-2<CR>==gi
vnoremap <Leader>j :m '>+1<CR>gv=gv
vnoremap <Leader>k :m '<-2<CR>gv=gv

set statusline="%f%m%r%h%w
