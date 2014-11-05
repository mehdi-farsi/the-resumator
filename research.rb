# encoding: utf-8
#!/usr/bin/ruby
# @Author: mehdi
# @Date:   2014-11-05 13:03:49
# @Last Modified by:   mehdi
# @Last Modified time: 2014-11-05 23:38:47

require './base'
require './formatter'

module Resumator
  # Search on google
  class Research < Base
    attr_reader :formatter

    def initialize(research)
      @formatter = Formatter.new
      page = get("#{BASE_URL}/search?q=#{research}")
      links = page.css('li.g h3 a').select 

      links.each do |link|
        uri = link['href']
        title = link.text
        @formatter.format("#{BASE_URL}#{uri}", title) if url_category? uri
      end
    end

    def results
      @formatter.results
    end

    private
    def url_category?(url)
      # google redirection URL start by '/url'
      !!(/^\/url/ =~ url)
    end
  end
end