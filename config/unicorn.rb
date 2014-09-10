# coding: utf-8
#
#------------------------------------------------------------------------------
## 起動確認 コマンド
## bundle exec unicorn_rails -E production -c config/unicorn.rb
##------------------------------------------------------------------------------
WORKING_DIR = "/home/ec2-user/public_html/tinQ"

# ワーカーの数
worker_processes 2
working_directory "#{WORKING_DIR}"

# ソケット Nginxの設定と合わせる
# # listen 8080, :tcp_nopush
listen "/tmp/unicorn.sock"

# nuke workers after 30 seconds instead of 60 seconds (the default)
timeout 60 # タイムアウトは１分

# feel free to point this anywhere accessible on the filesystem
pid "#{WORKING_DIR}/log/unicorn.pid"

# log.  By default, the Unicorn Logger will write to stderr.
# stderr_path File.expand_path('unicorn.log', File.dirname(__FILE__) + '/../log')
# stdout_path File.expand_path('unicorn.log', File.dirname(__FILE__) + '/../log')
stderr_path "#{WORKING_DIR}/log/unicorn.log"
stdout_path "#{WORKING_DIR}/log/unicorn.log"

# ダウンタイムをなくす
preload_app true


before_fork do |server, worker|
  old_pid = "#{WORKING_DIR}/log/unicorn.pid.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
