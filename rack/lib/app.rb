
class App
  def self.call(env)
    case env["REQUEST_METHOD"]
    when "GET"
      [200, {}, ["Hello World"]]
    when "POST"
      request = Rack::Request.new(env)
      body = request.body.read # this can be done once, 'body' gets cleaned after '.read'
      parsed_body = request.media_type.eql?('application/json') ? JSON.parse(body) : body
      # binding.pry

      file_path = 'data_storage'
      File.open(file_path, 'w') { _1.write(parsed_body) }

      [
        218, 
        {},
        ["THIS WAS A POST REQUEST. CONTENT SAVED TO '#{file_path}' FILE"]
      ]
    else
      Rack::Response.new('YourDad.zip', 410).finish
    end
  end
end

