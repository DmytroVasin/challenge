require 'rubygems'
require 'sinatra'

require_relative 'models/crawler.rb'
require_relative 'models/parser.rb'
require_relative 'models/sitemap_xml.rb'

get '/' do
  erb :index
end

# get '/parse' do
#   uri = URI.parse(params[:url_to_parse])
#   host, scheme = uri.host, uri.scheme

#   site_map = SitemapXml.new(host)
#   @file_path = if host && !site_map.exist?
#     parsed_links = Сrawler.new(host, scheme).start
#     site_map.create(parsed_links)
#   else
#     site_map.file_name
#   end
# end

# get '/download/:file_name' do
#   send_file(File.join(Rails.root, params[:file_name]))
# end
