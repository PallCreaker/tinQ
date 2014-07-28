# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'tinQ'
set :repo_url, 'github:PallCreaker/tinQ.git'
set :rbenv_ruby, '2.1.0'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value
set :unicorn_pid, "#{shared_path}/log/unicorn.pid"

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
# set :branch, 'master'

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/ec2-user/public_html/tinQ'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug
# set :log_level, :info

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}
set :linked_files, %w{/home/ec2-user/public_html/tinQ/config/database.yml}
# set :linked_files, "#{shared_path}config/database.yml"

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

framework_tasks = [:starting, :started, :updating, :updated, :publishing, :published, :finishing, :finished]
framework_tasks.each do |t|
  Rake::Task["deploy:#{t}"].clear
end
Rake::Task[:deploy].clear

namespace :deploy do

  desc 'Restart application'
  task :restart do
    # on roles(:app), in: :sequence, wait: 5 do
#       # Your restart mechanism here, for example:
#       # execute :touch, release_path.join('tmp/restart.txt')
      invoke "unicorn:restart"
#     end
  end

#   after :publishing, :restart

#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#       #   execute :rake, 'cache:clear'
#       # end
#     end
#   end
end

# namespace :deploy do
#   desc 'restart a unicorn or start a unicorn if it is not launch'
#   task :unicorn_start do
#     on roles(:all) do
#       execute "mkdir -p #{shared_path}/pids"
#       pid_file = "#{shared_path}/pids/unicorn.pid"
#       if test "[ -e #{pid_file} ]"
#         execute "kill -USR2 `cat #{pid_file}`"
#       else
#         execute "cd #{current_path} && UNICORN_PID=#{pid_file} bundle exec unicorn -p #{fetch(:unicorn_port)} -E production -c #{current_path}/config/unicorn.rb -D"
#       end
#     end
#   end

#   desc 'stop a unicorn'
#   task :stop do
#     on roles(:all) do
#       execute "kill -QUIT `cat #{shared_path}/pids/unicorn.pid`"
#     end
#   end

#   desc 'restart a unicorn'
#   task :restart do
#     on roles(:all) do
#       execute "kill -USR2 `cat #{shared_path}/pids/unicorn.pid`"
#     end
#   end
# end

# namespace :whenever do
#   desc "update crontab using whenever's schedule"
#   task :update_crontab do
#     on roles(:all) do
#       execute "cd #{current_path} && RAILS_ENV=#{fetch(:rails_env)} bundle exec whenever -w"
#     end
#   end
# end