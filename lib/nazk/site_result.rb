module Nazk
	class SiteResult
		include Nazk::Result
		def initialize html, site
			@site = site
			@html = html
			parse_html html
		end
	# private
		def parse_html html
			html_doc = Nokogiri::HTML html
			node = html_doc.css('.actualized-font.page-title span')
			@total_size = 0
			if node
				@total_size = $~[1].to_i if node.text.strip =~ /\((.*?)\)/i
			end
			
		end
	end
end