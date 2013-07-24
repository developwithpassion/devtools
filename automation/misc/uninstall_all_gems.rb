#!/usr/bin/env ruby

expression = Regexp.new(/(.*)\s(\(.*\))/)
gems = `gem list --local`.split("\n")
gems = gems.select{|item| expression =~ item}
other_gems = gems.map{|item| expression.match(item)[1]}

puts other_gems
