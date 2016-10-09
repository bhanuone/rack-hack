class RackHack
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["<h2>Hello #{wish(env)}"]]
  end

  def wish(env)
    path = env['REQUEST_PATH']
    if path =~ /^\/$/
      return "World!"
    else
      return path.split('/')[1]
    end
  end
end

run RackHack.new
