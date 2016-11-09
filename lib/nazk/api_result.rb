class Nazk::ApiResult
	include Nazk::Result
	def initialize json, api
		@api = api
		@result = JSON.parse(json)

		if @result["error"]
			raise "Error #{@result["error"]}: #{@result["message"]}"
		else
			parse_page @result["page"]
			parse_items @result["items"]
		end

	end



private
	def parse_page data
		@page_size = data["batchSize"]
		@total_size = data["totalItems"]
		@page_number = data["currentPage"]
	end

	def parse_items data
		# raise 'Count of items mismatch with page_size' if @page_size != data.count
		@current_page_items = data
	end
	
end