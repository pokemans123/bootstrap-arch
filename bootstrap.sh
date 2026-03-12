#!/bin/bash
#Meant to be run in chroot!!!

echo 'setting up pkglist and logging hooks...'
mkdir -p /var/lib/pkglist
touch /var/lib/pkglist/packages.txt
chmod 644 /var/lib/pkglist/packages.txt

cp ./log-packages.sh /usr/local/bin/log-packages.sh
chmod +x /usr/local/bin/log-packages.sh
cp ./log-packages.hook /usr/share/libalpm/hooks/log-packages.hook

cp ./packages.txt /var/lib/pkglist/packages.txt

pkgs=/var/lib/pkglist/packages.txt
echo 'please enter your username exactly as you set it:'
read user

mkdir -p "/home/$user"
chown $user:$user /home/$user

sudo -u "$user" bash << EOF
echo 'building yay...'
git clone --depth=1 https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

echo 'yay built successfully!'

echo 'installing packages...'
yay -S --needed --noconfirm <"$pkgs"
EOF

exit 0


