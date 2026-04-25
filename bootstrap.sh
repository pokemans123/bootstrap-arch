#!/bin/bash
#Meant to be run in chroot!!!

if [ $(whoami) != 'root' ]; then  
  echo 'Please run as root'
  exit 0
fi

echo 'setting up pkglist and logging hooks...'
mkdir -p /var/lib/pkglist
touch /var/lib/pkglist/packages.txt
chmod 644 /var/lib/pkglist/packages.txt

cp ./log-packages.sh /usr/local/bin/log-packages.sh
chmod +x /usr/local/bin/log-packages.sh
cp ./log-packages.hook /usr/share/libalpm/hooks/log-packages.hook

cp ./packages.txt /var/lib/pkglist/packages.txt

pkgs=/var/lib/pkglist/packages.txt
echo 'setup complete!'


