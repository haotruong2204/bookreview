# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

set :application, "bookreview"
set :repo_url, "git@github.com:haotruong2204/bookreview.git"

ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :deploy_to, "/var/www/#{fetch :application}"
set :format, :airbrussh
set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto
set :keep_releases, 5
set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip
set :pty, true

set :linked_files, %w[config/database.yml config/master.key .env]
set :linked_dirs, %w[log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads]

set :local_user, -> { `git config user.name`.chomp }
set :ssh_options, verify_host_key: :secure

set :puma_rackup, -> { File.join(current_path, "config.ru") }
set :puma_state, -> { "#{shared_path}/tmp/pids/puma.state" }
set :puma_pid, -> { "#{shared_path}/tmp/pids/puma.pid" }
set :puma_bind, -> { "unix://#{shared_path}/tmp/sockets/puma.sock" }
set :puma_conf, -> { "#{shared_path}/puma.rb" }
set :puma_access_log, -> { "#{shared_path}/log/puma_access.log" }
set :puma_error_log, -> { "#{shared_path}/log/puma_error.log" }
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, "production"))
set :puma_threads, [0, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false
