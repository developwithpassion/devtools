require File.join(File.expand_path(File.dirname(__FILE__)),%w[.. spec_helper])

require 'auto_crlf_toggler'

module Git
    describe AutoCrlfToggler,"when updating the git config autocrlf setting in the configuration" do

        BLAH_CONFIG = "blah.config"

        before(:each) do
            @match = /(autocrlf\s*=\s*)(\w*)/
            @crlf_toggler = AutoCrlfToggler.new(BLAH_CONFIG)
            @original = read_file_setting(File.join(ENV["HOME"],".gitconfig"))

            because
        end

        after(:each) do
            File.delete(BLAH_CONFIG)
        end

        def read_file_setting(file)
            return @match.match(File.read(file))[2]
        end

        def because
            @crlf_toggler.update_setting_to("false")
        end

        it "should change the settings in the output config file" do
            read_file_setting(BLAH_CONFIG).should == "false"
        end
    end
end
