$help_file_prefix = "developwithpassion_powershell_help_on_"

function purge_temp_help_files()
{
  ls $env:temp -force -filter "$help_file_prefix*" | del -force
}

function get_help($command_name)
{
  $temp_file_name = "$env:temp\$help_file_prefix$command_name.txt"
  del $temp_file_name -force -ErrorAction SilentlyContinue
  $help_topic = get-help $command_name -full
  $help_topic > $temp_file_name
  gvim.exe $temp_file_name
}

function kill_process($program_name)
{
  get-process -name "$program_name" | stop-process -force
}

