class Router
  attr_reader :request, :routes
  def initialize
    @routes = {}
  end

  def call(env)
    @request = Rack::Request.new(env)
    route = routes[[request.request_method, request.path]]
    if route
      call_action_for(route)
    else
      Rack::Response.new("File not found", 404)
    end
  end

  def add_route(method:, path:, handler:)
    routes[[method, path]] = handler
  end

  private
  def call_action_for(route)
    controller, action = route.split("#")
    controller_class = Kernel.const_get(controller)
    controller_class.new.public_send(action)
  end
end
