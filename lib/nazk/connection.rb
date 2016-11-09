module Nazk
	module Connection
	private
		def conn
			@conn ||= Faraday.new(url: url) do |faraday|
          		faraday.request :multipart
          		faraday.request :url_encoded
          		faraday.adapter Faraday.default_adapter
        	end
		end
	end
end