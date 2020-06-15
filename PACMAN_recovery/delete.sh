#!/bin/bash

for pkgName in  $(cat packages.txt)

do

	pacman -Rns $pkgName
done
echo " Reinstalled all python packages "
