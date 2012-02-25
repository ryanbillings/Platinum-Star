module ApplicationHelper
    def broadcast(channel, &block)
      message = {:channel => channel, :data => capture(&block), :ext => {:auth_token => FAYE_TOKEN}}
<<<<<<< HEAD
      uri = URI.parse("http://128.237.241.183:9292/faye")
=======
      uri = URI.parse("http://128.237.237.228:9292/faye")
>>>>>>> added twitter
      Net::HTTP.post_form(uri, :message => message.to_json)
    end
end
