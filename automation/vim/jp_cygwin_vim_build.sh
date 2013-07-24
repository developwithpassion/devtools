#!/usr/bin/bash
hg pull
hg update
hg merge
hg commit

make uninstall

./configure --enable-rubyinterp=dynamic --enable-cscope --with-features=huge --with-compiledby=JP --enable-fontset --enable-gui 
make && make install
