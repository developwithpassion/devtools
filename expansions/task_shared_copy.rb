expand do
  common_folders = %w[bash goobook git ruby vim vimperator offlineimap tmux notmuch mutt msmtp urlview gnupg].map{|item| [%w[shared dotfiles],item].as_glob_pattern}

  copy_to configatron.core.home do
    all_contents_in common_folders
  end
end
