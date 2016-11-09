module Nazk
	module ParamsBuilder
		MAP_PARAMS = {search: :q, deputy: "responsiblePositions[]"}	
		def initialize params={}
			@current_params = params
		end
		
		def deputy
			@current_params["responsiblePositions[]"] ||= []
			@current_params["responsiblePositions[]"]  << 2
			self
		end

		def presedent_level
			@current_params["responsiblePositions[]"] ||= []
			@current_params["responsiblePositions[]"]  << 1
			self
		end
	private
		def reset
			@current_params = {}
		end
		
		def map method_name
			MAP_PARAMS[method_name] || method_name
		end

		def method_missing(method_name, *args, &block)
			@current_params[map(method_name)] = args.count > 0 && args[0] || ''
			self
		end

	end
end