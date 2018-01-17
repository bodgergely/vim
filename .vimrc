set nocompatible              " be iMproved, required
filetype on                  " required
" 256-color terminal
set t_Co=256
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'
"Plugin 'rust-lang/rust.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'flazz/vim-colorschemes'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'fatih/vim-go'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'majutsushi/tagbar'
" All of your Plugins must be added before the following line
call vundle#end()            " required
syntax on
colorscheme badwolf
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"tab length config
"https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" press F2 to enable/disable clipboard pasting
set pastetoggle=<F2>

nmap <F8> :TagbarToggle<CR>

set number
set incsearch
set path+=**
"turn off auto commenting
augroup auto_comment
    au!
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

"ctrlP auto cache clearing.
" ----------------------------------------------------------------------------
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif

" cpp synatx plugin settings
let c_no_curly_error=1
let g:cpp_member_variable_highlight = 1

let g:rustfmt_autosave = 1

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_enable_diagnostic_highlighting = 0
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.

let mapleader = ","

" nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>df :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>dd :YcmCompleter GoToDefinitionElseDeclaration<CR>

noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

noremap <silent> <C-m> :cn<CR>
noremap <silent> <C-n> :cp<CR>

"key mappings
vnoremap <C-c> "+y
imap jj <esc>
nnoremap ; :
nnoremap : ;
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"map arrows to navigate windows!
map <Up>   <C-W>k
map <Down> <C-W>j
map <Left> <C-W>h
map <Right> <C-W>l
map vv 0
map nn <S-$>
map f y
map m p
" autocompletion remap to ctrl space
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>
let g:user_emmet_expandword_key = '<C-y>h'
:noremap <F4> :set hlsearch! hlsearch?<CR>
"highlight all occurences of word under cursor
:autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

let Tlist_Use_Right_Window = 1

" toggle pase/nopaste
set pastetoggle=<F3>
" copy to clipboard
noremap <Leader>Y "*y
noremap <Leader>P "*p
noremap <Leader>y "+y
noremap <Leader>f "+y
noremap <Leader>p "+p
let g:pymode_python = 'python3'
" disable preview window of code completion
set completeopt-=preview

" Quickfix window - use enter to open the file
autocmd FileType qf nnoremap <buffer> <Enter> <C-W><Enter>
" Quickfix window - use enter to open file in NEW TAB
"autocmd FileType qf nnoremap <buffer> <Enter> <C-W><Enter><C-W>T
