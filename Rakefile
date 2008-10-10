require 'config.rb'

desc 'Deploy to the server using rsync'
task :restart do
  sh "touch tmp/restart.txt"
end

desc 'Deploy to the server using rsync'
task :deploy => :restart do
  deploy = configatron.deploy
  cmd = "rsync -ruv * #{deploy.user}@#{deploy.domain}:#{deploy.path}"
  sh cmd
end

