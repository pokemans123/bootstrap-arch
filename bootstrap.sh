#!/bin/bash

if [ $(whoami) != 'root' ]; then  
  echo 'Please run as root'
  exit 0
fi

echo 'setting up pkglist and logging hooks...'
pkgdir=/var/lib/pkglist
mkdir -p $pkgdir
ln -sf ./packages.txt $pkgdir/packages.txt
echo 'setup complete! Please remove the .git file but do not remove this entire directory!'


