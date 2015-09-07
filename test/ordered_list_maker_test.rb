require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ordered_list_maker'

class OrderedListMakerTest < Minitest::Test

  def test_it_has_a_class
    assert OrderedListMaker
  end

  def test_it_can_make_an_ordered_list
    test_string = "1. Cole\n2. Matt\n3. Russell\n"
    result = OrderedListMaker.ordered_list(test_string)
    assert_equal "<ol><li>Cole</li><li>Matt</li><li>Russell</li></ol>", result
  end

end
