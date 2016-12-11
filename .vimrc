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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

let syntastic_javascript_checkers = ['eslint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_aggregate_errors = 1

command! -nargs=1 V :vim <args> src/**/*.*

set t_Co=256
set background=dark

let g:solarized_termcolors = 256
colorscheme solarized

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsEditSplit='vertical'

let g:UltiSnipsSnippetsDir='/Users/Mikey/.vim/mysnippets'
let g:UltiSnipsSnippetDirectories=["mysnippets", "UltiSnips"]
let g:UltiSnipsListSnippets='<s-tab>'

