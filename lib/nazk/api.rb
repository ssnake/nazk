module Nazk
	class Api
		MAP_PARAMS = {search: :q, deputy: "responsiblePositions[]"}	

		def initialize params={}
			@current_params = params

		end
		
		def go
			c = conn
			response = c.post '/v1/declaration/', @current_params
			# byebug
			if response.status == 200
				Nazk::Result.new(response.body, Nazk::Api.new(@current_params))
			else
				raise	"Error: #{response.inspect}"
			end
		ensure
			reset
		end

		def deputy
			@current_params["responsiblePositions[]"] ||= []
			@current_params["responsiblePositions[]"]  << 2
			self
		end

		def presedent_level
			@current_params["responsiblePositions[]"] ||= []
			@current_params["responsiblePositions[]"]  << 1
			self
		end

	private
		def reset
			@current_params = {}
		end
		def map method_name
			MAP_PARAMS[method_name] || method_name
		end

		def method_missing(method_name, *args, &block)
			
			@current_params[map(method_name)] = args.count > 0 && args[0] || ''
			self
		end

		def url
			"https://public-api.nazk.gov.ua"
		end

		def conn
			@conn ||= Faraday.new(url: url) do |faraday|
          		faraday.request :multipart
          		faraday.request :url_encoded
          		faraday.adapter Faraday.default_adapter
        	end
		end
	
	end
end