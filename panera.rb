require 'vendor/rack-0.4.0/lib/rack.rb'
require 'vendor/sinatra-0.3.1/lib/sinatra.rb'
require 'net/http'
require 'uri'
require 'config.rb'

def target_url(url)
  response = Net::HTTP.get_response(URI.parse(url))
  case response
    when Net::HTTPSuccess
      tinyurl
    when Net::HTTPRedirection 
      response['location']
    else
      response.error!
  end
end
    
get '/' do
  erb :index
end

post '/' do
  tinyurl = params[:tinyurl]
  redirect '/' unless tinyurl
  redirect target_url(tinyurl)
end

get '/:id' do
  redirect target_url("http://tinyurl.com/#{params[:id]}")  
end