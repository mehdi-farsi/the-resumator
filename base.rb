#!/usr/bin/ruby
# @Author: mehdi
# @Date:   2014-11-05 12:46:20
# @Last Modified by:   mehdi
# @Last Modified time: 2014-11-06 00:02:46

require 'nokogiri'
require 'net/http'
require 'uri'

module Resumator
  BASE_URL = 'https://www.google.fr'
  class Base
    def get(url)
      uri = URI.parse(URI.escape(url))
      response = Net::HTTP.get_response(uri) # get Headers + Body

      if ['301', '302'].include? response.code # check if redirection is needed via HTTP Status Code
        @url = response['Location'] # Redirection URL set in 'Location' Header
        uri = URI.parse(@url)
        Nokogiri::HTML(Net::HTTP.get(uri)) # Get Body of redirection URL
      else
        Nokogiri::HTML(response.body) # Save a call by using the already downloaded response. 
      end
    end
  end
end