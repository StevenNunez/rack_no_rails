class Router
  attr_reader :request, :routes
  def initialize
    @routes = {}
  end

  def call(env)
    @request = Rack::Request.new(env)
    current_route = Route.new(path:request.path, method:request.request_method)
    route, handler = routes.find do |route, handler|
      route === current_route
    end
    if handler
      route.update_params!(request)
      call_action_for(handler, request)
    else
      Rack::Response.new("File not found", 404)
    end
  end

  def add_route(method:, path:, handler:)
    routes[Route.new(method:method, path:path)] = handler
  end

  private
  def call_action_for(handler, request)
    controller, action = handler.split("#")
    controller_class = Kernel.const_get(controller)
    controller_class.new(request).public_send(action)
  end
end
