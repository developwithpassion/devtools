expand do
  shared_contents = %w[zsh rvm].map{|item| ['shared','dotfiles',item].as_glob_pattern}

  copy_to configatron.core.home do
    all_contents_in shared_contents
  end

  brew_exists = system("brew --prefix")
  if brew_exists
    copy_to [`brew --prefix`.chomp,'Library'].as_glob_pattern do
      contents ['mac','brew'].as_glob_pattern
    end
  end

end
