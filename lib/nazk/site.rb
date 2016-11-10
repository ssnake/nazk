module Nazk
	class Site
		include ParamsBuilder
		include Connection
		def initialize params={}
			@current_params = params

			get_cookies_csrftoken
		end
		
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
		def get_params
			@current_params.merge csrftoken: @token
		end

		def get_cookies_csrftoken
			resp = get_response 'https://public.nazk.gov.ua/search'
			raise 'Unable to connect to nazk' if resp.status != 200
			@cookies = resp.headers["set-cookie"].split[0]

			html_doc = Nokogiri::HTML resp.body
			nodes = html_doc.css('form[data-csrftoken]')
			@token = decrypt nodes.first["data-csrftoken"]

		end
		def decrypt encoded_token
			encoded_token.reverse!.swapcase!
			Base64.decode64(encoded_token).reverse
		end
		def get_cookies
			@cookies
		end

	end
end