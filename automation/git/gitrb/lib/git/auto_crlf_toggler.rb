module Git
    class AutoCrlfToggler
        def initialize(output_file = File.join(ENV["HOME"],".gitconfig"))
            @output_file = output_file
        end

        def update_setting_to(flag)
            contents = File.read(File.join(ENV["HOME"],".gitconfig")) 
            contents = contents.gsub(/(autocrlf\s*=\s*)(\w*)/,"\\1#{flag}")
            File.open(@output_file,'w') do|file|
                file.puts contents
            end
        end
    end
end
