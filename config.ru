require 'vendor/rack-0.4.0/lib/rack.rb'
require 'vendor/sinatra-0.3.1/lib/sinatra.rb'
require 'config.rb'

deploy = configatron.deploy

Sinatra::Application.default_options.merge!(
  :root => deploy.path,
  :views => deploy.path + '/views',
  :public => deploy.path + '/public',
  :run => false,
  :env => :production
)
 
log = File.new("sinatra.log", "w")
STDOUT.reopen(log)
STDERR.reopen(log)

require 'panera.rb'
run Sinatra.application