module ApplicationHelper
    def broadcast(channel, &block)
      message = {:channel => channel, :data => capture(&block), :ext => {:auth_token => FAYE_TOKEN}}
      uri = URI.parse("http://blooming-day-4197.herokuapp.com/faye")
      Net::HTTP.post_form(uri, :message => message.to_json)
    end
end
