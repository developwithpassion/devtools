require 'formula'

class Macvim < Formula
    head 'git://repo.or.cz/MacVim.git'
    homepage 'http://code.google.com/p/macvim'

    def configure_environment_variables
        # MacVim's Xcode project gets confused by $CC, disable it until someone
        # figures out why it fails
        ENV['CC'] = nil
        ENV['CFLAGS'] = nil
        ENV['CXXCFLAGS'] = nil
    end

    def package_with_features
        system "./configure",
               "--with-features=huge",
               "--enable-cscope",
               "--enable-perlinterp",
               "--enable-pythoninterp",
               "--enable-rubyinterp",
               "--enable-tclinterp"
        system "make"
    end

    def configure_vim_diff
        %w[mvimdiff mview mvimex].each do|f|
            (bin + f).make_symlink("#{bin}/mvim")
        end
    end


    def install
        configure_environment_variables
        package_with_features

        libexec.install "src/MacVim/build/Release/MacVim.app"
        inreplace "src/MacVim/mvim", /^# VIM_APP_DIR=\/Applications$/,
                  "VIM_APP_DIR=#{libexec}"
        bin.install "src/MacVim/mvim"

        configure_vim_diff

    end

    def caveats
        "MacVim.app installed to #{libexec}"
    end
end
        
