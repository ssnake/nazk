require 'test_helper'

class NazkSiteTest < Minitest::Test
  def setup
  	@site = Nazk::Site.new
  end
  
  def test_deputy_and_presedent
  	# skip
  	result =@site.responsiblePositions([1,2]).search('').go
  	puts "presedent_level count: #{result.total_size}"
  	assert_equal 1, result.page_number
  	puts result.items[0]
  	# assert_equal 2, result.next.page_number
  end
end
