module Git
  module Input
    extend self

    def pick_item_from(items,prompt)
      puts "#{prompt}\n"

      items.each_with_index do |item, index| 
        puts "#{index + 1} - #{item}"
      end

      index = gets.chomp.to_i

      return index == 0 ? "": items[index-1]
    end
  end

  module Commands
    extend self

    def non_master_branches
      master_branch_pattern = /(\*.* | master)/

      branches = run_git_command("branch", true)
      branches = branches.split("\n")
      branches = branches.select{ |branch| master_branch_pattern !~ branch }

      branches
    end

    def delete_all_other_branches
      master_branch_pattern = /(\*.* | master)/
      branches = run_git_command("branch", true)
      branches = branches.split("\n")
      branches = branches.select{ |branch| master_branch_pattern !~ branch }

      branches.each do |branch|
        branch_delete branch
      end
    end

    def choose_branch
      Input.pick_item_from(non_master_branches, "Which branch?")
    end

    #add and commit everything on the current working branch
    def commit
      add_all
      run_git_command("commit")
    end

    def switch(branch_name=choose_branch)
      add_all 
      checkout(branch_name)
    end

    #switch to a branch - will create the branch if it does not already exist
    def checkout(branch_name=choose_branch)
      if branch_exists?(branch_name)
        run_git_command("checkout #{branch_name}")
      else
        run_git_command("checkout -b #{branch_name}") 
      end
    end

    #merge everything from the target branch into the current working branch
    def merge(target_branch=choose_branch)
      commit
      run_git_command("merge #{target_branch}")
    end

    #pull all of the changes from the specified remote onto a named local branch
    #if a local_branch is not specified it will create a new branch and do the pull
    #onto that branch
    def pull(remote, remote_branch='master', create_new_branch=false)
      commit
      create_new_branch ||= false
      remote_branch ||= 'master'
      local_branch_name = "pull_#{remote}_#{remote_branch}" 
      checkout(local_branch) if (create_new_branch)
      run_git_command("pull --rebase #{remote} #{remote_branch}")
    end

    #reset all of the changes on the current working branch
    def reset(*args)
      run_git_command("reset --hard", false)
      run_git_command("clean -d -f #{args.join(' ')}")
    end

    #performs a commit, merge, and push to a remote
    #if the branch_to_push_from is different that the current working
    #branch, it will switch to that branch and first do a merge of
    #the current working branch
    def push(remote, branch_to_push_from=nil, switch_back_to_working=true)
      branch = active_branch
      branch_to_push_from ||= active_branch
      switch_back_to_working ||= true
      commit
      if (branch_to_push_from != branch)
        checkout(branch_to_push_from)
        merge(branch)
      end
      run_git_command("push #{remote} #{branch_to_push_from}") 
      checkout(branch) if switch_back_to_working
    end

    def active_branch
      active_branch_pattern = /\*\s*(.*)\n/
      output = run_git_command("branch", true)
      match = active_branch_pattern.match(output)
      match[1]
    end

    def add_all
      run_git_command("add -A")
    end

    def run_git_command(command, capture_ouptut = false)
      full_command = "git #{command}"

      return `#{full_command}` if (capture_ouptut)

      system(full_command)
    end

    def branch_delete(branch_name=choose_branch)
      run_git_command("branch -D #{branch_name}")
    end


    def branch_exists?(branch_name)
      branch_pattern = /#{branch_name}/
      output = run_git_command("branch", true)
      not (branch_pattern =~ output).nil?
    end
  end
end
