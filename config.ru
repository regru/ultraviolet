map "/ultraviolet" do
  run Rack::File.new(".")
end

map "/" do
  run Proc.new { [ 302, {"Location"=> "/ultraviolet/index.html", "Content-Type"=>"text/html" }, [] ] }
end
