require 'commands'

module Git
  module Runner
    extend self

    def run(args)
      command = args.shift
      Commands.send(command, *args)
    end
  end
end
