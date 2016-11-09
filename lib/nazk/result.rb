module Nazk
	module Result
		def items
			@current_page_items
		end
		
		def total_size
			@total_size
		end
		
		def page_size
			@page_size
		end

		def next
			@api.page(@page_number + 1).go
		end

		def page_number
			@page_number
		end
	end
end