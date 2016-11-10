require 'test_helper'
require "base64"
class Base64Test < Minitest::Test
  def test_one
		encoded = '=ewo5qdnHnMy0uMyYCtnHz2n5GdnYmJmHLtz2yMmKfMn'
		encoded.reverse!.swapcase!
		assert_equal 'a9944acb4eb275af7984232a9e6f2da6', Base64.decode64(encoded).reverse
  end
  
end
