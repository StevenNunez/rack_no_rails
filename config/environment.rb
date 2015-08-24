require 'bundler'
Bundler.require(:default)

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3', 
  database: 'potd_development.db'
)
