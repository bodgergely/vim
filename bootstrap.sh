sudo apt update

install_searchsploit()
{
    sudo git clone https://github.com/offensive-security/exploitdb.git /opt/exploitdb
    sed 's|path_array+=(.*)|path_array+=("/opt/exploitdb")|g' /opt/exploitdb/.searchsploit_rc > ~/.searchsploit_rc
    sudo ln -sf /opt/exploitdb/searchsploit /usr/local/bin/searchsploit
}
