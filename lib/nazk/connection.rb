module Nazk
	module Connection
		def go
			c = conn
			response = c.post path, @current_params
			if response.status == 200
				get_result(response.body)
			else
				raise	"Error: #{response.inspect}"
			end
		ensure
			reset
		end
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