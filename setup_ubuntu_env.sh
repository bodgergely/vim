alias agi='sudo apt-get install'
mkdir -p ~/.ssh
# ssh key
ssh-keygen -t rsa -b 4096 -C "bodgergely@hotmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
# end of ssh

agi tmux
agi vim-gtk
agi okular
agi xclip
agi git
agi ctags
agi cscope
agi wireshark
agi python-ipython
agi ipython
agi ipython3

