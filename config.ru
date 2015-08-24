require_relative 'config/environment'
require_relative 'config/routes'

use Rack::ContentType
use Rack::Static, urls: ['/css']
run Routes
