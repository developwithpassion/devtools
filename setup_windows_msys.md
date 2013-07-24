##Running On Windows

* For the most optimal experience it is strongly recommended to configure your windows machine with the base set of tools outlined [here](http://blog.developwithpassion.com/2012/03/12/repaving-a-new-window-7-vm/)

###MSYS

* Open up an msys session and navigate into the devtools folder you cloned above.
* Type in the following command:
```
./msys_kick_off
```
* Change the settings in the [your_login_user_name].settings file as needed
* Type in the following command:
  ```
  ./msys_kick_off
  ```
* Exit your shell session
* Start a new msys session and type devtools (this is an alias that should now be active)
* Run the script:
  ```
  update_vim_plugins
  ```
At this point vim should be configured, and autohotkey should be running with the scripts loaded in.

##Gotchas

1. The autohotkey scripts are setup to assume that you are using your LWIN key to trigger the mnemonic entry modes (more on that later). When I am on a windows based contract, I will run a client specific windows VM under vmware fusion. I also have my keyboard shortcuts on osx setup so that my CapsLock key is the [Command key](https://skitch.com/jpboodhoo/8ccwh/system-preferences)

2. Even though I don't use it a lot, [executor](http://executor.dk/) is the launcher that I use on windows, and it is assumed to be setup to launch with the ALT-Q binding.

