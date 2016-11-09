module Nazk
	class Api
		include ParamsBuilder
		include Connection

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



	private



		def url
			"https://public-api.nazk.gov.ua"
		end


	
	end
end