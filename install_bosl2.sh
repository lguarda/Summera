#!/usr/bin/env bash

mkdir -p $HOME/.local/share/OpenSCAD/libraries/BOSL2/

cd /tmp
wget https://github.com/BelfrySCAD/BOSL2/archive/refs/heads/master.zip
unzip master.zip
rsync -a BOSL2-master/ $HOME/.local/share/OpenSCAD/libraries/BOSL2/
rm master.zip
rm -rf BOSL2-master
