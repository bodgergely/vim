VIMFILE=vimrc

if [ "$#" -gt 0 ]; then
    VIMFILE=$1
fi


#creating vimrc
touch vimrc
echo "set nocompatible" >> vimrc
echo "filetype on" >> vimrc
echo "filetype plugin indent on" >> vimrc
echo "filetype plugin on" >> vimrc
echo "syntax on" >> vimrc
echo "syntax enable" >> vimrc
echo "set number" >> vimrc
echo "set pastetoggle=<F3>" >> vimrc
echo "nnoremap ; :" >> vimrc
echo "nnoremap : ;" >> vimrc
echo "imap jk <esc>" >> vimrc
echo "imap kj <esc>" >> vimrc
echo "map vv 0" >> vimrc
echo "map nn <S-$>" >> vimrc
echo "map f y" >> vimrc
echo "set tabstop=4" >> vimrc
echo "set shiftwidth=4" >> vimrc
echo "set expandtab" >> vimrc

