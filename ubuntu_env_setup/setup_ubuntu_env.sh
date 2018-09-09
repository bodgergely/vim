#mkdir -p ~/.ssh
# ssh key
#ssh-keygen -t rsa -b 4096 -C "bodgergely@hotmail.com"
#eval "$(ssh-agent -s)"
#ssh-add ~/.ssh/id_rsa
# end of ssh
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install tmux
sudo apt-get -y install htop
sudo apt-get -y install ranger
sudo apt-get -y install vim-gtk
sudo apt-get -y install okular
sudo apt-get -y install xclip
sudo apt-get -y install git
sudo apt-get -y install cmake
sudo apt-get -y install ctags
sudo apt-get -y install cscope
sudo apt-get -y install wireshark
sudo apt-get -y install python-ipython
sudo apt-get -y install ipython
sudo apt-get -y install ipython3
sudo apt-get -y install qemu
sudo apt-get -y install qemu-system-x86
sudo apt-get -y install qemu-kvm
sudo apt-get -y install qemu-system
sudo apt-get -y install qemu-system-arm
sudo apt-get -y install qemuctl
sudo apt-get -y install qemu-utils
sudo apt-get -y install apache2
sudo apt-get -y install php
sudo apt-get -y install php-pear php-fpm php-dev php-zip php-curl php-xmlrpc php-gd php-mysql php-mbstring php-xml libapache2-mod-php
sudo apt-get -y install libapache2-mod-php
sudo apt-get -y install php-cli
sudo apt-get -y install virtualbox && sudo apt-get -y install virtualbox-guest-utils


# java - installer is interactive - needs human input
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y update
sudo apt -y install oracle-java8-installer

