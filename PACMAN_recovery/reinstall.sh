#!/bin/bash

for pkgName in  $(cat packages.txt)

do

	pacman -S --force --noconfirm $pkgName
done
echo " Reinstalled all python packages "
