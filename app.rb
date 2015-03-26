require 'rubygems'
require 'sinatra'

require Dir.pwd + '/parser.rb' # наш класс для парсинга сообщений из Твиттера


get '/' do
  @title = 'Welcome to the Suffragist!'
  erb :index
end
# post '/cast' do
#   @title = 'Thanks for casting your vote!'
#   @vote  = params['vote']
#   erb :cast
# end

# get '/hello/:name' do
#   params[:name]
# end


# ----------------------
  # root 'welcome#index'
  # get 'parse', to: 'welcome#parse'
  # get 'download/:file_name', to: 'welcome#download'
