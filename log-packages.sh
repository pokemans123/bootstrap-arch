#!/bin/bash

logdir="/var/lib/pkglist"
mkdir -p "$logdir"
pacman -Qqe > "$logdir/packages.txt"
