#\ -p 8000
class RackHack
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["<h2>Hello #{wish(env)}</h2>"]]
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
class Styles
  def initialize(resp)
    @resp = resp
  end
  def call(env)
    status, headers, body = @resp.call(env)
    body = add_styles(body)
    [status, headers, body]
  end

  def add_styles(body)
    style_container = "<style> h2{border 3px solid green; width: 100%; background: crimson; color:white} </style>"
    body.map{ |b| "<body>#{style_container} #{b} </body>" }
  end
end
use Styles
run RackHack.new
