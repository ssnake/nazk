module Nazk
	class Api
		include ParamsBuilder
		include Connection

		def initialize params={}
			@current_params = params

		end
		
		



	private

		def get_result body
			Nazk::Result.new(body, Nazk::Api.new(@current_params))
		end

		def path
			'/v1/declaration/'
		end
		
		def url
			"https://public-api.nazk.gov.ua"
		end
	end
end