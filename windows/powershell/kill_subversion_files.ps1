function kill_subversion_files($folder)
{
  if (($folder -eq $null) -or ([System.IO.Directory]::Exists($folder) -eq $false))
  {
    "usage: kill_subversion_files.ps1 [path_to_folder_to_purge_subversion_files_from]"
  }
  else
  {
    "Deleting all subversion files from $folder"
    get-childitem $folder -recurse -force -include *svn | remove-item -recurse -force
  }
}
