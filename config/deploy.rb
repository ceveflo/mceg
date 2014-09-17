# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'mceg'
set :deploy_user, 'deploy'

set :repo_url, 'https://github.com/OskrNav/mceg.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
set :branch, 'master'

# Database Password to selected env
set :database_password, ask('Database Password', "MySQL #{fetch(:stage)}")

# Default deploy_to directory is /var/www/my_app
set :deploy_to, "/home/deploy/apps/#{fetch(:application)}"

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
#set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# setup rbenv.
set :rbenv_type, :system
set :rbenv_ruby, '2.1.2'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}

# Default value for keep_releases is 5
set :keep_releases, 5

# which config files should be copied by deploy:setup_config
# see documentation in lib/capistrano/tasks/setup_config.cap
# for details of operations
set(:config_files, %w(
  database.yml
))

namespace :deploy do

  # desc 'Restart application'
  # task :restart do
  #   on roles(:app), in: :sequence, wait: 5 do
  #     # Your restart mechanism here, for example:
  #     # execute :touch, release_path.join('tmp/restart.txt')
  #   end
  # end
  
  before :deploy, "deploy:check_revision"

  after 'deploy:symlink:shared', 'deploy:compile_assets_locally'
  after :publishing, :restart

  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     # Here we can do anything such as:
  #     # within release_path do
  #     #   execute :rake, 'cache:clear'
  #     # end
  #   end
  # end

end
