module Nazk
	module Connection
		def go
			c = conn
			response = c.post path, get_params do |req|
				req.headers['Cookie'] = get_cookies
			end
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
		def get_response url
			Faraday.get url
		end
		def get_params
			@current_params
		end
		def get_cookies
			''
		end
	end
end