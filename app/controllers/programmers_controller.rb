class ProgrammersController
  attr_reader :request
  def initialize(request)
    @request = request
  end

  def index
    programmers = Programmer.all
    template = File.read('app/views/programmers/index.html.erb')
    result = ERB.new(template).result(binding)
    Rack::Response.new(result)
  end

  def show
    programmer = Programmer.find(request.params["id"])
    template = File.read("app/views/programmers/show.html.erb")
    Rack::Response.new(ERB.new(template).result(binding))
  end
end
