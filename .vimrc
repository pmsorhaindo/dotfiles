"Mikey's .vimrc
"
" This is obviously a work in progress as I can barely vim.
" Things that need doing:
" - Use Vim 8.
" - A script to build and install vim from source.
" - Find away to sync and pull my snippets with github or somewhere else

" Because I'm 1337..
" Because I don't want people touching my keyboard..
" Because I hate myself!
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

" Matt Franglen had some influence here obviously
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
Plug 'tpope/vim-commentary'
" Plug 'alfredodeza/plexer.vim'
" Plug 'vim-scripts/greplace.vim'
"
call plug#end()

" Syntastic set up for JS
" TODO look at python and Haskell
let syntastic_javascript_checkers = ['eslint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

let g:syntastic_aggregate_errors = 1

" Audience project searching
" consider wrapping <args> in quotes
command! -nargs=1 V :vim <args> src/**/*.*
command! -nargs=1 T :vim <args> test/**/*.*

" Prettyness!
set t_Co=256
set background=dark

let g:solarized_termcolors = 256
colorscheme solarized


" Ultisnips set up to use custom snippets and fall back on
" the snippets provided by honza
" TODO pull custom snippets from my own repo.
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsEditSplit='vertical'

let g:UltiSnipsSnippetsDir='/Users/Mikey/.vim/mysnippets'
let g:UltiSnipsSnippetDirectories=["mysnippets", "UltiSnips"]
let g:UltiSnipsListSnippets='<s-tab>'

" Ctrl P setup prevent's searching of node_modules
" TODO look at project specific settings for this
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules)',
  \ }

"Qargs move the files in quickfix to args
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" Move lines with leader direction
nnoremap <Leader>j :m .+1<CR>==
nnoremap <Leader>k :m .-2<CR>==
inoremap <Leader>j <Esc>:m .+1<CR>==gi
inoremap <Leader>k <Esc>:m .-2<CR>==gi
vnoremap <Leader>j :m '>+1<CR>gv=gv
vnoremap <Leader>k :m '<-2<CR>gv=gv

" More prettyness
" TODO put this all in one place
set statusline="%f%m%r%h%w

" Open quickfix files in a new view with <leader> + Enter
autocmd! FileType qf nnoremap <buffer> <leader><Enter> <C-w><Enter><C-w>L

" Enable line numbers in Nerdtree
let NERDTreeShowLineNumbers=1
" Make sure relative line numbers are used too
autocmd FileType nerdtree setlocal relativenumber


" Mikey Vim FAQ's
" Look at generalising :g like the magic below
" or at least start using it more
" TODO :g/^    label/ normal ^y$A ^R0^[

" Window resizing
" Ctrl + w + <  or Ctrl + w + >

" Window movement
" Ctrl + F or B
