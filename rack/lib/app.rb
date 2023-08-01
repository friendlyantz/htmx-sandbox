
class App
  def self.call(env)
      # binding.pry
    case env["REQUEST_METHOD"]
    when "GET"
      [200, {}, [File.read("lib/index.html")]]
    when "POST"
      request = Rack::Request.new(env)
      body = request.body.read # this can be done once, 'body' gets cleaned after '.read'
      parsed_body = request.media_type.eql?('application/json') ? JSON.parse(body) : body

      file_path = 'data_storage'
      File.open(file_path, 'w') { _1.write(parsed_body) }

      [ 218, {}, [
        "RESPONSE FROM POST REQUEST, with payload: <#{parsed_body}>", "<br>",
        "==========================", "<br>",
        File.read("lib/index.html"),
      ] ]
    else
      Rack::Response.new('YourDad.zip', 410).finish
    end
  end
end

