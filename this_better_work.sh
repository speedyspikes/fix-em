#!/bin/bash
arg=$1
if [[ $arg = "?" ]]; then
    echo "ufw"
    echo "ftp"
    echo "ssh"
    # echo "mysql"
fi    

# ufw
if [[ $arg = "" ]] || [[ $arg = "ufw" ]]; then
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw allow Apache
    sudo ufw allow 'Apache Full'
    sudo ufw allow 'Apache Secure'
    #sudo ufw allow CUPS
    sudo ufw allow OpenSSH
    sudo ufw allow Samba
    #sudo ufw allow [port]
    #sudo ufw allow from [IP]
    sudo ufw enable
fi

# ftp
if [[ $arg = "" ]] || [[ $arg = "ftp" ]]; then
    sudo service proftpd stop
    sudo update-rc.d vsftpd disable
fi

# ssh
if [[ $arg = "" ]] || [[ $arg = "ssh" ]]; then
    sudo mv /etc/ssh/sshd_config /etc/ssh/sshd_config.old
    sudo cp sshd_config /etc/ssh/
    sudo service ssh restart
    sudo service ssh status
fi

# mysql
# if [[ $arg = "" ]] || [[ $arg = "mysql" ]]; then
#     sudo mysql
#     ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_strong_password';
#     FLUSH PRIVILEGES;
# fi
