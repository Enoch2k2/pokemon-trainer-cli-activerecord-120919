require 'pry'
require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.sqlite3')

require_relative "./pokemon_trainer/version"
require_relative "./pokemon_trainer/cli"
require_relative "./pokemon_trainer/pokemon"
require_relative "./pokemon_trainer/trainer"