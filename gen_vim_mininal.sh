VIMFILE=vimrc

if [ "$#" -gt 0 ]; then
    VIMFILE=$1
fi


#creating vimrc
touch $VIMFILE
echo "set nocompatible" >> $VIMFILE
echo "filetype on" >> $VIMFILE
echo "filetype plugin indent on" >> $VIMFILE
echo "filetype plugin on" >> $VIMFILE
echo "syntax on" >> $VIMFILE
echo "syntax enable" >> $VIMFILE
echo "set number" >> $VIMFILE
echo "set pastetoggle=<F3>" >> $VIMFILE
echo "nnoremap ; :" >> $VIMFILE
echo "nnoremap : ;" >> $VIMFILE
echo "imap jk <esc>" >> $VIMFILE
echo "imap kj <esc>" >> $VIMFILE
echo "map vv 0" >> $VIMFILE
echo "map nn <S-$>" >> $VIMFILE
echo "map f y" >> $VIMFILE
echo "set tabstop=4" >> $VIMFILE
echo "set shiftwidth=4" >> $VIMFILE
echo "set expandtab" >> $VIMFILE
echo "set mouse=a" >> $VIMFILE
