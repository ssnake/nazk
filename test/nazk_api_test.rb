require 'test_helper'

class NazkApiTest < Minitest::Test
  def setup
  	@api = Nazk::Api.new
  end
  def test_that_it_has_a_version_number
    refute_nil ::Nazk::VERSION
  end

  def test_search
  	skip
    result =@api.search('Володимирович').go
    assert result.items.count > 0
    assert_equal 1, result.page_number
    assert result.total_size > 0
    assert result.page_size > 0
    # r2 = result.next
    # assert_equal 2, r2.page_number

  end

  def test_deputy
  	skip
  	result =@api.deputy.search('').deputy.go
  	puts "presedent_level count: #{result.total_size}"
  	assert_equal 1, result.page_number
  	puts result.items.first
  	# assert_equal 2, result.next.page_number
  end
end
