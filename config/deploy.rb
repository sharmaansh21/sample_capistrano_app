require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/rbenv"
load "config/recipes/env"
load "config/recipes/check"

role :web, "xxx.xxx.xxx.xxx"
role :app, "xxx.xxx.xxx.xxx"
role :db, "xxx.xxx.xxx.xxx", primary: true

set :user, "deployer"
set :application, "sample_capistrano_app"
set :base_domain, "example.com"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :is_default?, false #set true if this app is the 'default' or 'primary' nginx site (there can only be one default)
set :is_https?, false #set true if using HTTPS


set :scm, "git"
set :repository, "git@github.com:j10io/#{application}.git"
set :branch, "master"


default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

#Uncomment for carrierwave gem, which uploads to public/uploads (don't want to overwrite of uploads on each deployment)
#set :shared_children, shared_children + %w{public/uploads}

# Uncomment to include path to SSL, don't forget to chown root and chmod 400
# You'll need to manually place your certificate files on the server - this doesn't do it for you I'm afraid.
#set :ssl_cert_path, "/home/#{user}/apps/#{application}/cert.crt"
#set :ssl_key_path, "/home/#{user}/apps/#{application}/cert.key"