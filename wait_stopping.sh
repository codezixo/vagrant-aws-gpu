#!/bin/sh

ruby -e 'loop do exit if `vagrant status` =~ /stopped/; puts "."; sleep 10; end'
