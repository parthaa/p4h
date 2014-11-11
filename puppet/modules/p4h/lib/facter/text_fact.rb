Facter.add("text_fact") do
  setcode do
    Dir.glob("/var/lib/puppet/tmp/p4h/*").map do |fl|
      IO.readlines(fl).map(&:strip)
    end.flatten.join(",")
  end
end
