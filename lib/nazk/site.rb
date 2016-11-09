module Nazk
	class Site
		include ParamsBuilder
		include Connection

		
	private
		def get_result body
			Nazk::SiteResult.new(body, Nazk::Site.new(@current_params))
		end
		def path
			'/search'
		end
		def url
			'https://public.nazk.gov.ua'
		end
	end
end