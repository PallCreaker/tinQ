# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

set :branch, 'master'
set :stage, :production

role :app, %w{ec2-user@54.92.51.166}
role :web, %w{ec2-user@54.92.51.166}
role :db,  %w{ec2-user@54.92.51.166}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

# server '54.92.51.166', user: 'ec2-user', port: 22, roles: %w{app}, my_property: :my_value


# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
 # set :ssh_options, {
 #   keys: %w(~/.ssh/Labelier.pem),
 #   # forward_agent: false,
 #   # auth_methods: %w(password)
 #   forward_agent: true, #サーバーから直接githubのプライベートリポジトリにアクセスするためにforward_agentをtrueにしておく。
 #   auth_methods: %w(publickey)
 # }
#
# And/or per server (overrides global)
# ------------------------------------
server '54.92.51.166',
  user: 'ec2-usasdfasdfers',
  roles: %w{web app},
  # keys: %w(~/.ssh/tinq.pem),
  ssh_options: {
    # podrt: 22,
    user: 'ec2f-user', # overrides user setting above
    keys: %w(~/.ssh/tinq.pem),
    # keys: %w(/Users/KazumasaFujita1/.ssh/tinq.pem),
    forward_agent: true,
    # auth_methods: %w(publickey password)
    auth_methods: %w(publickey)
    # password: 'please use keys'
  }