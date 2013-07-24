expand do
  register_executable %w[automation vim vim_plugin_update].as_glob_pattern
  register_executable %w[automation vim twitvim].as_glob_pattern
  register_executable %w[automation autohotkey ahk_start].as_glob_pattern
  register_executable %w[automation timers timer].as_glob_pattern
  register_executable %w[automation perl ack].as_glob_pattern
  register_executable %w[automation visual_studio sln].as_glob_pattern
  register_executable %w[automation visual_studio launch_vs_solution].as_glob_pattern

  globs_to_register = [
    %w[automation divvy divvy].as_glob_pattern,
    %w[automation git *.sh].as_glob_pattern
  ]

  globs_to_register.each do|item|
    glob(item){|file| register_executable file}
  end

end
