##Overview

This repository contains the majority of the files that I use to customize all aspects of the different programming related environments that I in on both osx and windows.

The repository consists of mainly the following:

* A set of automation scripts that can be modified and added to as needed.
* A set of dotfiles that I have run successfully on:
  * Ubuntu
  * OSX
  * Windows (Cygwin/Msys)
* Templates for the files that will be transformed to run on the differing platforms.
* A small set of expansion scripts run using [expansions](http://github.com/developwithpassion/expansions).

##Cautionary Note

* Some of the scripts are obviously tuned to work according to a flow that works well for me. Even though some work has been done to allow these scripts to be portable and usable by others. I apologize in advance for the "assumptions" that are made about how the system is setup (particularly for windows users). A lot of the configuration scripts attempt to isolate those changes, but there may be areas that I missed. Since these scripts were
  initially written just for myself, there may still be a couple of areas where some of the assumptions about how the system is configured cause the scripts to fail. See these scripts as a good starting point for you to be able to support cross platform environment setup from a single set of scripts, dotfiles etc.

##Preparation

* Even though it is not required, to not have to fuss too much with the settings, create the following folder structure under your home folder named:
  * repositories/developwithpassion
  * Navigate to the folder you created above and make a clone of this repository (keep the devtools name). Feel free to fork the repository before you make a clone if you would like to send me pull requests.
  
##Once you have the folder cloned continue with the following readme's, specific to the environment you are using:
  * [OSX](http://github.com/developwithpassion/devtools/blob/master/setup_osx.md)
  * [MSys On Windows](http://github.com/developwithpassion/devtools/blob/master/setup_windows_msys.md)
  * [Cygwin On Windows](http://github.com/developwithpassion/devtools/blob/master/setup_windows_cygwin.md)

##Contributing

As always, feel free to fork and make modifications to the scripts etc. If you add something you find useful, please feel free to send me a pull request.

[Develop With Passion®](http://www.developwithpassion.com)
