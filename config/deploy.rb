set :application, "vida.fm"

set :deploy_to, "/home/vidafm/dev/#{application}"

set :scm, :git
set :repository,  "git@github.com:soshkt/HelloWorld.git"
set :branch, "master"
set :deploy_via, :remote_cache

set :user, 'vidafm'
set :ssh_options, { :forward_agent => true }
default_run_options[:pty] = true


$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'
require 'bundler/capistrano'
set :rvm_ruby_string, 'ruby-1.8.7-p352@rails3.1'
set :rvm_path, "/home/vidafm/.rvm/bin/rvm"
set :rvm_bin_path,      "/home/vidafm/.rvm/bin/"
set :rvm_lib_path,      "/home/vidafm/.rvm/lib/"


role :web, "api.vida.fm:33356"                         # Your HTTP server, Apache/etc
role :app, "api.vida.fm:33356"                          # This may be the same as your `Web` server
role :db,  "api.vida.fm:33356", :primary => true # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end