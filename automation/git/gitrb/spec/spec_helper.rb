require 'date'
$:.unshift File.join(File.dirname(__FILE__),%w[.. bin])

Dir.chdir(File.join(File.dirname(__FILE__),%w[.. lib])) do
    Dir.glob("*").each do |lib| 
        $:.unshift File.expand_path(lib)
    end
end

RSpec.configure do |config|
 config.mock_with :rr
end

module RSpec
    Matchers.define :start_with do|start_of_string|
        match do|string_element|
            string_element.start_with?(start_of_string).should be_true
        end
    end

    Matchers.define :end_with do|end_of_string|
        match do|string_element|
            string_element.end_with?(end_of_string).should be_true
        end
    end
end

