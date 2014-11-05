# encoding: utf-8
#!/usr/bin/ruby
# @Author: mehdi
# @Date:   2014-11-05 13:09:19
# @Last Modified by:   mehdi
# @Last Modified time: 2014-11-05 23:29:26

require './base'

module Resumator
  # Search on google
  class Formatter < Base
    attr_reader :results

    def initialize
      @results = []
    end

    def format(url, title)
      @url = url
      page = get(@url)
      content = ""
      contents = page.css('p').select
      contents.each do |c|
        content += ". #{c.text}"
        break if content.length > 1000
      end

      @results << {title: title, content: content, link: @url}
    end
  end
end