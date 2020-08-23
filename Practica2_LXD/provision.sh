sudo apt-get install lxd -y
newgrp lxd
sudo lxd init --auto
sudo lxc launch ubuntu:20.04 server
sudo lxc exec server -- apt-get install apache2
sudo lxc file push index.html server/var/www/html/index.html
sudo lxc exec server -- systemctl restart apache2
sudo lxc config device add server myport80 proxy listen=tcp:192.168.100.3:5080 connect=tcp:127.0.0.1:80
sudo lxc exec server bash
echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
sudo service sshd restart
