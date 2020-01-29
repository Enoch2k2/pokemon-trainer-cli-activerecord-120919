require "bundler/gem_tasks"
require "rspec/core/rake_task"
# require_relative "lib/environment.rb"

require 'standalone_migrations'

StandaloneMigrations::Tasks.load_tasks

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

# desc "starts a pry console"
# task :console do
#   Pry.start
# end
