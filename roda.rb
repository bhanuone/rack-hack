require 'roda'

class MyApp < Roda
  route do |r|
    r.root do
      (1..100).to_a.to_s
    end
  end
end
run MyApp
