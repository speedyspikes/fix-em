#!/bin/bash
arg=$1
if [[ $arg = "?" ]]; then
    echo "ufw"
fi    

# ufw
if [[ $arg = "" ]] || [[ $arg = "ufw" ]]; then
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw allow Apache
    sudo ufw allow Apache Full
    sudo ufw allow Apache Secure
    sudo ufw allow CUPS
    sudo ufw allow OpenSSH
    sudo ufw allow Samba
    #sudo ufw allow [port]
    #sudo ufw allow from [IP]
    sudo ufw enable
fi
