# rackup for http://localhost:9292/
require 'rubygems'
require 'bundler'

Bundler.require(:default)

require_relative 'models/crawler.rb'
require_relative 'models/parser.rb'
require_relative 'models/sitemap_xml.rb'
require_relative 'helpers/helper.rb'

include Helper::Support

get '/' do
  erb :index
end

get '/parse' do
  uri = URI.parse(params[:url_to_parse])
  host, scheme = uri.host, uri.scheme

  site_map = SitemapXml.new(host)
  @file_path = if host && !site_map.exist?
    parsed_links = Crawler.new(host, scheme).start
    site_map.create(parsed_links)
  else
    site_map.file_name
  end

  halt 200, {file_path: @file_path}.to_json
end

get '/download/:file_name' do
  send_file File.expand_path(params[:file_name], settings.public_folder), disposition: 'attachment'
end
