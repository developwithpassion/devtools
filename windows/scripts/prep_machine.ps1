$profile_folder = $env:userprofile
$remote_profile_folder = "$profile_folder\AppData\Roaming"
$startup_folder = "$remote_profile_folder\Microsoft\Windows\Start Menu\Programs\Startup"
$powershell_profile_folder = "$profile_folder\Documents\WindowsPowershell"
$jetbrains_profile_folder = "$remote_profile_folder\JetBrains\ReSharper\v6.0"
$jetbrains_targets = ("vs10.0")

$workstation_lock_path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System"

$registry_entries = @{"HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System" = "disable_lock_workstation.reg"}

function configure_registry_entries()
{
  $registry_entries.keys | foreach-object{
    $exists = test-path $_
    if ($exists -eq $false){
      . "..\registry_entries\$($registry_entries[$_])"
    }
  }
}

function configure_path()
{
  $new_path = [Environment]::GetEnvironmentVariable("PATH","Machine")
  $changed = $false;

  $original_elements = $new_path.split(";")
  $path_elements | foreach-object {
    if ($original_elements -contains $_ -eq $false)
    {
      $new_path = $new_path + ";$_" 
      $changed = $true;
    }
  }
  if ($changed) {
    [Environment]::SetEnvironmentVariable("PATH",$new_path,"MACHINE")
  }
}

function init_temp_folders()
{
  mkdir C:\tempfiles -ErrorAction SilentlyContinue
  mkdir C:\tempfiles\vimtemp -ErrorAction SilentlyContinue
  mkdir C:\tempfiles\vimtemp\other -ErrorAction SilentlyContinue
}

function copy_powershell_scripts()
{
  del $powershell_profile_folder -force -recurse -ErrorAction SilentlyContinue
  new-item $powershell_profile_folder -force -type Directory
  ls ..\powershell\*.ps1 | cp -destination "$powershell_profile_folder"
  ls ..\powershell\*.psm1 | cp -destination "$powershell_profile_folder"
}

function copy_profile_settings()
{
  cp ..\viemu\_viemurc $profile_folder
}

function copy_auto_hotkey_scripts()
{
  remove-item "$startup_folder\*.*" -force -recurse
  get-item ..\autohotkey\*.lnk | foreach-object { copy-item $_ $startup_folder }
}

function copy_executor_ini_file()
{
  cp ..\executor\executor.ini "$remote_profile_folder\Executor" 
}

function copy_resharper_settings()
{
  $jetbrains_targets | foreach-object { cp ..\resharper\*.* -destination "$jetbrains_profile_folder\$_" -ErrorAction SilentlyContinue }
}    

function copy_console_scripts()
{
  cp ..\console\*.* -destination C:\utils\console -force -ErrorAction SilentlyContinue
}

copy_profile_settings
copy_auto_hotkey_scripts
copy_powershell_scripts
copy_resharper_settings
copy_auto_hotkey_scripts
configure_path
configure_registry_entries
