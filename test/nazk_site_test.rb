require 'test_helper'

class NazkSiteTest < Minitest::Test
  def setup
  	@site = Nazk::Site.new
  end
  
  def test_deputy
  	# skip
  	result =@site.deputy.search('').deputy.go
  	puts "presedent_level count: #{result.total_size}"
  	
  end
end
