set nocompatible              " be iMproved, required
filetype on " required

" enable mouse support
:set mouse=a
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
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'flazz/vim-colorschemes'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'fatih/vim-go'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'dkprice/vim-easygrep'
"Plugin 'NLKNguyen/papercolor-theme'
Plugin 'hdima/python-syntax'
Plugin 'altercation/vim-colors-solarized'
" All of your Plugins must be added before the following line
call vundle#end()            " required
syntax on
syntax enable
"set termguicolors     " enable true colors support
set background=light
colorscheme solarized
"colorscheme PaperColor
"colorscheme badwolf
"colorscheme murphy
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
set number
set incsearch
set path+=**
set modifiable

" scrolling should be only 5 lines (c-d and ctrl-u)
set scroll=5
noremap <C-u> 5<C-u>
noremap <C-d> 5<C-d>

" reload files automatically
set autoread

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


let g:SuperTabNoCompleteAfter = ['^', '\s', '"', "'", ',', '.', ':', '[', ']', '(', ')', '{', '}']

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_python_binary_path = '/usr/bin/python3'
"let g:ycm_enable_diagnostic_highlighting = 0
nnoremap gd         :YcmCompleter GoTo<CR>

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.

let mapleader = ","

noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

"key mappings
vnoremap <C-c> "+y
"imap jj <esc>
imap jk <esc>
imap kj <esc>
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
let g:jedi#goto_definitions_command = "gd"
let g:force_py_version = 3

" toggle pase/nopaste
set pastetoggle=<F3>
" copy to clipboard
noremap <Leader>Y "*y
noremap <Leader>P "*p
noremap <Leader>y "+y
noremap <Leader>p "+p

let g:pymode_python = 'python3'

" disable Preview window
set completeopt-=preview

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif


" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif

" change the current directory
autocmd BufEnter * silent! lcd %:p:h
autocmd TextChanged,TextChangedI <buffer> silent write

set dictionary+=/usr/share/dict/words
