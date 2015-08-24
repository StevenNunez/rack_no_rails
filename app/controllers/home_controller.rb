class HomeController
  attr_reader :request
  def initialize(request)
    @request = request
  end

  def index
    template = File.read('app/views/home/index.html.erb')
    Rack::Response.new(template)
  end
end
