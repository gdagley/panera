require 'vendor/configatron/lib/configatron.rb'

configatron.configure_from_yaml('config.yml') if configatron.nil?
