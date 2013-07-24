#!/usr/bin/env ruby
require 'autotest-fsevent'
require 'autotest/growl'

AUTOTEST_IMAGE_PATH = File.dirname(File.symlink?(__FILE__) ? File.readlink(__FILE__) : File.expand_path(__FILE__))
MATCH_PATTERN = /\d+\s.*examples?,\s\d+\s.*failures?(?:,\s\d+\s.*pending)?/

module Autotest::Growl
  def self.display(results,image)
      growl_it :image => image, :results => results, :message => "Spec Results"
  end

  def self.get_result_image(output)
    if output =~ /[1-9]\sfailures?/ || output =~ /errors/
      item  ="red"
    elsif output =~ /pending/
      item = "pending"
    else
      item = "green"
    end
    File.join(AUTOTEST_IMAGE_PATH,"#{item}.jpg")
  end

  Autotest.add_hook :ran_command do |autotest|
    filtered = autotest.results.grep(/\d+\s.*examples?/)
    output = filtered.empty? ? "errors" : filtered.last.slice(MATCH_PATTERN)
    display(output,get_result_image(output))
  end

  def self.growl_it (args)
     `growlnotify -n autotest --image #{args[:image]} -m #{args[:results].inspect} #{args[:message]}`
  end

end

Autotest.add_hook :initialize do |autotest|
  %w{.svn .hg .git vendor}.each {|exception| autotest.add_exception(exception)}
end
