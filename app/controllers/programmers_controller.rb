class ProgrammersController
  attr_reader :request
  def call(env)
    @request = Rack::Request.new(env)
    if request.get? && request.path == '/programmers'
      index
    else
      Rack::Response.new("File not found", 404)
    end
  end

  def index
    programmers = Programmer.all
    template = File.read('app/views/programmers/index.html.erb')
    result = ERB.new(template).result(binding)
    Rack::Response.new(result)
  end
end
