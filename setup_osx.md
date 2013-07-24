#OSX Configuration

* This document assumes you have cloned the devtools repository into the following folder on your machine:
  * ~/repositories/developwithpassion/devtools

1. Open a terminal shell and navigate to your devtools folder
2. Run the following command
   ```
   ./osx_or_cygwin_kick_off
   ```
2. Exit the terminal session
3. Start a new terminal session and navigate back to the devtools folder.
4. Run the following commands:
   ```
   ./osx_or_cygwin_finish
   ```

##Configuring Brew (Only if you don't already have it installed)

###Prerequisites

* An Intel CPU 2
* OS X 10.5 or higher
* Command Line Tools for Xcode or Xcode 3with X11 4

1. Open a real prompt (ie. Terminal.app, not in e.g. an Emacs-shell) and navigate to your devtools folder
2. Run the following command
   ```
   ./automation/brew/brew_install
   ```
3. Close the prompt and reopen a new prompt and navigate back to the devtools folder
4. Run the following command
   ```
   ./automation/brew/brew_configure_base_packages
   ```
At this point you will have a configured brew instance with the following packages installed:

* coreutils
* ctags
* freetds
* gdbm
* git
* ircii
* libevent
* links
* lynx
* macvim
* neon
* node
* pkg-config
* readline
* reattach-to-user-namespace
* sqlite
* tmux
* unixodbc
* xz
* zsh
