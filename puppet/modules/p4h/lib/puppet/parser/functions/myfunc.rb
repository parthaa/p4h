    module Puppet::Parser::Functions
      newfunction(:myfunc, :type => :rvalue) do |args|
        lines = IO.readlines(args[0]).map(&:strip)
        "Items #{lookupvar('hostname')} - #{lines.inspect}"
      end
    end