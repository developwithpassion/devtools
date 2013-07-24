#!/usr/bin/env ruby

def create_sym_link(target,link)
    system("rm -rf #{link}") unless File.symlink?(link)
    system("ln -s #{target} #{link}") unless File.exists?(link) || ! File.exist?(target)
end

{'/Volumes/machd/tempfiles' => '/tempfiles',
 '/Volumes/machd/to_backup' => '/to_backup',
 '/Volumes/machd/dropbox' => '/dropbox',
 '/tempfiles/downloads' => '~/Downloads',
 '/to_backup/repositories/dropbox' => '~/Dropbox',
 '/to_backup/repositories' => '~/repositories'
}.each{|target,link| create_sym_link(target,link)}
