#!/usr/bin/env ruby

require 'fileutils'

class Arguments
  attr_accessor :file
  attr_accessor :type
  attr_accessor :open_with
  attr_accessor :temp_dir

  def temp_dir
    @temp_dir ||= "/tempfiles/mutt_attachments"
  end

  def base_file_name
    @base_file_name ||= File.basename(file)
  end

  def base_file_name_without_extension
    File.basename(base_file_name, File.extname(base_file_name))
  end
end

def build_arguments(arguments)
  result = Arguments.new

  arguments.each do|argument|
    pair = argument.split(":")
    name = pair[0].gsub(/-/,"")
    value = pair[1]
    result.send "#{name}=", value
  end
  result
end

arguments = build_arguments(ARGV)

system("mkdir -p #{arguments.temp_dir}")
system("rm -rf #{arguments.temp_dir}/*")


new_file_name = ""
if (arguments.type == "-")
  new_file_name = File.basename(arguments.file)
else
  new_file_name = "#{arguments.base_file_name_without_extension}.#{arguments.type}"
end

new_file_name = File.join(arguments.temp_dir, new_file_name)
FileUtils.cp arguments.file, new_file_name

if (arguments.open_with)
  system("open -a #{arguments.open_with} #{new_file_name}")
else
  system("open #{new_file_name}")
end
