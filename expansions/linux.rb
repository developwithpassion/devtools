expand do
  shared_contents = %w[zsh rvm].map{|item| ['shared','dotfiles',item].as_glob_pattern}

  copy_to configatron.core.home do
    all_contents_in shared_contents
  end

end
