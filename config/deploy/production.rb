set :stage, :production
set :rails_env, :production
set :branch, "main"

server "54.179.2.119", user: "ubuntu", roles: %w(web app db)
