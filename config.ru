require_relative 'config/environment'
use Rack::ContentType
map '/' do
  run HomeController.new
end
