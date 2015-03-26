class SitemapXml
  def initialize host
    @host = host
  end

  def create urls
    open_file(file_path, urls) { |path, links|
      insert_xml_structure(path, links)
    }
    file_name
  end

  def exist?
    File.exist?(file_path)
  end

  def file_name
    "#{ parameterize(@host) }.xml"
  end

  private
  def file_path
    "public/#{file_name}"
  end

  def open_file file_path, data, &block
    File.open(file_path, 'w+') do |file|
      block.call(file, data) if block_given?
    end
  end

  def insert_xml_structure file, data
    today = Date.today
    xml = Builder::XmlMarkup.new(target: file, indent: 2)
    xml.instruct! :xml, encoding: 'UTF-8',  version: '1.0'

    xml.urlset 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
      data.each do |link|
        xml.url do
          xml.loc link
          xml.lastmod today
          xml.changefreq 'daily'
          xml.priority 0.9
        end
      end
    end
  end
end
