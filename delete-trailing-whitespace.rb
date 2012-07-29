#!/usr/bin/env ruby
# -*- coding: utf-8 -*-#
# This script deletes trailing whitespaces

def delete_trailing_whitespace(fpath)
  contents = []
  File.open(fpath, "r") do |file|
    while line = file.gets
      line =~ /(.*?)\s*$/
      contents << $1
    end
  end

  File.open(fpath, "w") do |file|
    contents.each do |line|
      file.puts line
    end
  end
end

def main
  if ARGV.empty?
    usage
    exit 1
  end

  ARGV.each do |fname|
    fpath = File.expand_path(fname)
    delete_trailing_whitespace(fpath)
  end
end

def usage(msg = nil)
  puts msg if msg

  puts <<-DESC
  Usage:
    $ #{$0} file1 file2 ..

  DESC
end

if $0 == __FILE__
  main
end
