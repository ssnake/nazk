module Nazk
	class SiteResult
		include Nazk::Result
		def initialize html, site
			@api = site
			@html = html
			@current_page_items = []
			parse_html html
		end
	private
		
		def parse_html html
			html_doc = Nokogiri::HTML html
			#parse total size
			node = html_doc.css('.actualized-font.page-title span')
			@total_size = 0
			if node
				@total_size = $~[1].to_i if node.text.strip =~ /\((.*?)\)/i
			end
			#parse items
			rows = html_doc.css '.row.search-results div.row'	
			rows.each do |item|
				item.css('header a.break-words').each do |a|
					a['href'] =~ /\w{8}-\w{4}-\w{4}-\w{4}-\w{12}/

					@current_page_items << {id: $~[0], name: a.text.strip}
				end
			end
			#parse current page
			@page_number = html_doc.css('ul.pagination li.active')[0].text.to_i
			@page_size = @current_page_items.count
		end

	end
end