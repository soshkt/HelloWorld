require 'rubygems'
load 'deploy'

load 'config/deploy' # remove this line to skip loading any of the default tasks

# Uncomment if you are using Rails' asset pipeline
load 'deploy/assets'

Dir['vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
