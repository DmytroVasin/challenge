class Crawler
  def initialize host, scheme
    @host = host
    @scheme = scheme
    @root_url = "#{scheme}://#{host}"

    @visited_links = []
    @founded_links = []
  end

  def start deep_lvl: 1
    arr = [@root_url]
    deep_lvl.times do
      arr = parse_url(arr)
    end
    arr.unshift(@root_url)
  end

  private

  def parse_url urls
    threads = []
    current_page_links = []

    urls.each{ |url|
      if @visited_links.exclude? url
        @visited_links << url

        # THREAD Start:
        threads << Thread.new(url) do |_url|
          p "Fetch #{url}"
          page = Curl.new(_url).visit
          p "Got response for #{url}"

          if page.is_opened
            current_page_links << page.get_links_with(@root_url)
          else
            []
          end
        end
        # THREAD stop:
      end
    }
    threads.each &:join

    @founded_links = @founded_links | current_page_links.flatten
  end
end
