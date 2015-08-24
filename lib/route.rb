class Route
  attr_reader :method, :path
  def initialize(method:, path:)
    @method = method
    @path = path
  end

  def update_params!(request)
    return unless has_dynamic_segment?

    keys = path.scan(/:(\w+)/).flatten
    values = request.path.scan(match_path).flatten
    dynamic_segment_params = keys.zip(values).to_h
    request.params.merge!(dynamic_segment_params)
  end


  def ===(other)
     match_path === other.path && method == other.method
  end

  private

  def match_path
    return path unless has_dynamic_segment?
    Regexp.new(path.gsub(/:\w+/, '(\w+)') + "$")
  end

  def has_dynamic_segment?
    path.include?(":")
  end
end
