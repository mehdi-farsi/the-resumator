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
