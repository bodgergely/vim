set nocompatible              " be iMproved, required
set encoding=utf-8

" enable mouse support
set mouse=a

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" 256-color terminal
"set t_Co=256
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
Plugin 'scrooloose/nerdcommenter'
"Plugin 'scrooloose/syntastic'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'
Plugin 'rust-lang/rust.vim'
"Plugin 'racer-rust/vim-racer'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'flazz/vim-colorschemes'
"Plugin 'liuchengxu/space-vim-dark'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'fatih/vim-go'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'dkprice/vim-easygrep'
Plugin 'NLKNguyen/papercolor-theme'
"Plugin 'dracula/vim'
Plugin 'hdima/python-syntax'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'rdnetto/YCM-Generator'  " generate YouCompleteMe config file for C++ projects
Plugin 'SirVer/ultisnips'       " snippet engine
Plugin 'honza/vim-snippets'     " actual snippets for languages
Plugin 'prettier/vim-prettier'
"Plugin 'ternjs/tern_for_vim'   " javascript
"Plugin 'pangloss/vim-javascript'
"Plugin 'moll/vim-node'          " nodejs
"Plugin 'nikvdp/ejs-syntax'
"Plugin 'dbgx/lldb.nvim'
"Plugin 'cocopon/iceberg.vim'
Plugin 'xolox/vim-misc'          " for lua
Plugin 'xolox/vim-lua-ftplugin'  " for lua
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
" ---------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype on " required
syntax on
syntax enable
set background=dark

"colorscheme baycomb     " really nice blue!
"colorscheme birds-of-paradise
"colorscheme dracula
"colorscheme black_angus
"colorscheme space-vim-dark
"hi Comment guifg=#5C6370 ctermfg=59
"colorscheme PaperColor
"colorscheme solarized
"colorscheme badwolf
colorscheme murphy
filetype plugin indent on    " required
filetype plugin on
" To ignore plugin indent changes, instead use:
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
set number
set incsearch
set path+=**
set modifiable

let mapleader = ","

" scrolling should be only 5 lines (c-d and ctrl-u)
set scroll=5
noremap <C-u> 5<C-u>
noremap <C-d> 5<C-d>

" NERDtree
let g:NERDTreeWinSize=30
let NERDTreeIgnore = ['\.o$', '\.ko$']
nmap <silent><leader>nt :NERDTreeToggle<CR>
nmap <silent><leader>nf :NERDTreeFind<CR>
" NERDCommenter
map <leader>/ <plug>NERDCommenterToggle<CR>

" fzf
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-t> :Tags<CR>

" reload files automatically
set autoread

" grep
if executable('rg')
  set grepprg=rg\ --ignore-case\ --no-heading\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif
" bind K to grep word under cursor
"nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash) to grep shortcut
"command! -bang -nargs=* GGrep silent! grep! <args>|cwindow|redraw!
nmap <leader>f :grep -R<SPACE>

" quickfix
nmap <leader>q :copen<CR>
nmap <leader>qc :cclose<CR>

" Fugitive
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>dp :diffput<CR>
nnoremap <leader>dg :diffget<CR>

" Goimport
let g:go_fmt_command = "goimports"

" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
" hacks from above (the url, not jesus) to delete fugitive buffers when we
" leave them - otherwise the buffer list gets poluted
" add a mapping on .. to view parent tree
au BufReadPost fugitive://* set bufhidden=delete
au BufReadPost fugitive://*
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END


"turn off auto commenting
augroup auto_comment
    au!
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" cpp synatx plugin settings
let c_no_curly_error=1
let g:cpp_member_variable_highlight = 1

let g:rustfmt_autosave = 1
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
let g:racer_experimental_completer = 1


let g:SuperTabNoCompleteAfter = ['^', '\s', '"', "'", ',', '.', ':', '[', ']', '(', ')', '{', '}']
let g:ycm_server_python_interpreter="/usr/bin/python3.6"
"let g:ycm_server_python_interpreter="/usr/bin/python3.7"
let g:ycm_confirm_extra_conf = 0 " do not ask for confirmation to load the ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_python_binary_path = '/usr/bin/python3.6'
let g:ycm_enable_diagnostic_highlighting = 0
"nnoremap gd         :YcmCompleter GoTo<CR>
nnoremap gd <C-]>
let g:ycm_autoclose_preview_window_after_insertion = 1
" Start autocompletion after 4 chars
"let g:ycm_min_num_of_chars_for_completion = 4
"let g:ycm_min_num_identifier_candidate_chars = 4
" Don't show YCM's preview window [ I find it really annoying ]
let g:ycm_add_preview_to_completeopt = 0

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.


noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

"key mappings
vnoremap <C-c> "+y
"imap jj <esc>
imap jk <esc>
imap kj <esc>
nnoremap ; :
"nnoremap : ;
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>
"map arrows to navigate windows!
"map <Up>   <C-W>k
"map <Down> <C-W>j
"map <Left> <C-W>h
"map <Right> <C-W>l
map vv 0
map nn <S-$>
map f y
" autocompletion remap to ctrl space
"inoremap <C-Space> <C-x><C-o>
"inoremap <C-@> <C-Space>
let g:user_emmet_expandword_key = '<C-c>,' " html tag expansion keyword
:noremap <F4> :set hlsearch! hlsearch?<CR>
"highlight all occurences of word under cursor
":autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))


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
autocmd FileType python setlocal completeopt-=preview


" javascript
autocmd FileType js UltiSnipsAddFiletypes javascript-jasmine
" enhance YCM JS completion with tern's smarts
"autocmd FileType javascript setlocal omnifunc=tern#Complete
"au BufNewFile,BufRead *.ejs set filetype=html     "ejs syntax highlighting


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

"change the current directory
autocmd BufEnter * silent! lcd %:p:h
autocmd TextChanged,TextChangedI <buffer> silent write

set dictionary+=/usr/share/dict/words

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
" Scheme support
if has("autocmd")
    au BufReadPost *.rkt,*.rktl set filetype=scheme
endif

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<C-a>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:UltiSnipsUsePythonVersion = 3
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" START OF INSERT source: https://github.com/Valloric/YouCompleteMe/issues/420
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
" END OF INSTER


"If one has a particular extension that one uses for binary files (such as exe,
"bin, etc), you may find it helpful to automate the process with the following
"bit of autocmds for your <.vimrc>.  Change that "*.bin" to whatever
"comma-separated list of extension(s) you find yourself wanting to edit:

" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

" rust language code browsing stuff
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)


" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

