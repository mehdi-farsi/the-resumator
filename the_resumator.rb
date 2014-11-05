#!/usr/bin/env ruby
# @Author: mehdi
# @Date:   2014-11-05 12:43:29
# @Last Modified by:   mehdi
# @Last Modified time: 2014-11-05 23:38:59

require './research'

def main
  input = $stdin.readline
  puts "Please wait for résumé of #{input}"


  research = Resumator::Research.new(input.chomp)

  research.results.each do |result|
    puts; puts result[:title]; puts
    puts result[:content].strip; puts
    puts result[:link]; puts
    puts '------------------------'
  end
end

main