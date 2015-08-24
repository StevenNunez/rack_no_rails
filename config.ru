require_relative 'config/environment'
require_relative 'config/routes'

use Rack::ContentType
run Routes
