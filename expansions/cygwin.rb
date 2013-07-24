expand do
  before do
    load %w[automation autohotkey ahk_stop].as_glob_pattern
  end

  copy_to '/c/Windows/System32/drivers/etc' do
    contents %w[shared hosts].as_glob_pattern
  end

  shared_contents = %w[zsh rvm].map{|item| ['shared','dotfiles',item].as_glob_pattern}

  copy_to configatron.core.home do
    all_contents_in shared_contents
  end


  partials = glob(%w[windows autohotkey partial_*.ahk].as_glob_pattern)
  headers = glob(%w[windows autohotkey merge_header_*.ahk].as_glob_pattern)
  footers = glob(%w[windows autohotkey merge_footer_*.ahk].as_glob_pattern)

  log "There are #{partials.count} autohotkey scripts"

  partials.each do|partial|
    merge_to partial.gsub("partial_","") do
      dont_read_original_file_contents
      headers.each{|header| add_before_original_contents(header)}
      add_before_original_contents(partial)
      footers.each{|footer| add_after_original_contents(footer)} unless /caps_as_windows_key/ =~ partial
    end
  end

  cleanup do
    FileUtils.rm_rf [configatron.core.home, %w[.vim_runtime bundle developwithpassion snippets]].as_glob_pattern

    launch_file = %w[windows autohotkey launch_ahk].as_glob_pattern
    FileUtils.rm_rf launch_file

    File.open(launch_file,'w') do|file|
     file << "#!/bin/bash\n"
      glob(%w[windows autohotkey ahk*.ahk].as_glob_pattern) do|ahk_script|
        start_command = configatron.core.is_cygwin ? 'cygstart' : 'start'
        file << "#{start_command} #{File.expand_path(ahk_script)}\n"
      end
    end
  end
end
