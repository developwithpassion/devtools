require 'rubygems'
require 'interactive_editor'


# Color Coding
# http://www.alloycode.com/2010/6/26/automatic-color-coding-for-script-console-and-irb
begin
  require "ap"
  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value
    end
  end
rescue LoadError => e
  puts "ap gem not found. Try typing 'gem install awesome_print' to get super-fancy output."
end

