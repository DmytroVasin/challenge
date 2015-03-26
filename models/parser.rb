require 'open-uri'
require 'nokogiri'

class Parser
  attr_reader :is_opened

  def initialize url
    @url = url
  end

  def visit
    begin
      @is_opened = true
      @page = Nokogiri::HTML(open("#{@url}"))
    rescue
      @is_opened = false
    end

    self
  end

  def get_links_with root_url
    _, host = root_url.split('://')

    array_of_available_links = @page.css('a').inject([]){ |result, link|
      href = link['href']
      result << add_domain(href,root_url) unless href == '/' ||
                                                        href == '#' ||
                                                        href =~ /((?!(http|https)):\/\/(?!#{host})[\w\.\/\-=?#]+)/ ||
                                                        href =~ /^javascript:+/ ||
                                                        href =~ /^mailto:+/
      result
    }.flatten.uniq
  end

  private
  def add_domain link, root_url
    /^(#{root_url})/ =~ link ? link : "#{root_url}#{link}"
  end
end
