module Nazk
	class Site
		include ParamsBuilder
		include Connection
		
	private
		def url
			'https://public.nazk.gov.ua'
		end
	end
end