require 'erb'
require 'bundler'
Bundler.require(:default)

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/potd_development.db'
)

$: << '.'

Dir['app/controllers/*.rb'].each {|f| require f}
Dir['app/models/*.rb'].each {|f| require f}
Dir['lib/*.rb'].each {|f| require f}
