module Nazk
	class Api
		include ParamsBuilder
		include Connection


		
		



	private

		def get_result body
			Nazk::ApiResult.new(body, Nazk::Api.new(@current_params))
		end

		def path
			'/v1/declaration/'
		end
		
		def url
			"https://public-api.nazk.gov.ua"
		end
	end
end