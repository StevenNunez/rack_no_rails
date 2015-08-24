require_relative 'config/environment'
class App
  def call(env)
    request = Rack::Request.new(env)
    if request.get? && request.path_info == "/"
      HomeController.new(request).index
    else
      Rack::Response.new("File not found", 404)
    end
  end
end

use Rack::ContentType
run App.new
