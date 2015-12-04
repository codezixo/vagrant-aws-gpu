#!/bin/sh

ruby -e 'loop do exit unless `vagrant status` =~ /stopping/; puts "."; sleep 10; end'
