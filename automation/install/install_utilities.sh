#!/usr/bin/env bash

install_quicksilver()
{
    if [ ! -x /Applications/Quicksilver.app ]; then 
        pushd /tempfiles/new_osx_install/startup_software
        rm Quicksilver.app
        tar -xzvf "quicksilver.tar.gz"
        cp -R "Quicksilver.app" /Applications
        popd
    fi
    devtools_sync
}

install_pygments()
{
  easy_install Pygments
}

install_quicksilver
install_pygments
