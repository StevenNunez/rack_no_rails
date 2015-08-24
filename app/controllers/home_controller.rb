class HomeController
  attr_reader :request
  def call(env)
    @request = Rack::Request.new(env)
    if request.get? && request.path == '/'
      index
    else
      Rack::Response.new("File not found", 404)
    end
  end

  def index
    template = File.read('app/views/home/index.html.erb')
    Rack::Response.new(template)
  end
end
