#!/usr/bin/env ruby
STDOUT.sync=true
loop do
  exit unless `vagrant status` =~ /stopping/
  print "."
  sleep 10
end
