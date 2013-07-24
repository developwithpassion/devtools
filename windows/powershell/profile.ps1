$env:TERM = 'cygwin'
$env:LESS = 'FRSX'
$profile_folder = $env:userprofile
$powershell_profile_folder = "$profile_folder\Documents\WindowsPowershell"
$prep_scripts_location = "$HOME\repositories\developwithpassion\devtools\windows\scripts"

$current_location = pwd
cd $powershell_profile_folder
ls *.ps1 -exclude "profile.ps1" | foreach-object{. .\"$($_.name)"}
cd $current_location

function Prompt {
   "$(get-location) 
 =>"
}

function prep_machine
{
  cd $prep_scripts_location
  & "$prep_scripts_location\prep_machine.ps1"
  cd $current_location
}


