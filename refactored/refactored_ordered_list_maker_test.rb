require_relative 'refactored_ordered_list_maker'
require 'minitest/autorun'
require 'minitest/pride'

class OrderedListMakerTest < Minitest::Test

  def test_it_has_a_class
    assert OrderedListMaker
  end


  def test_it_can_strip_off_white_space_and_numerals
    result = OrderedListMaker.formatted("1. Cole\n2. Matt\n3. Russell\n")
    assert_equal ["Cole", "Matt", "Russell"], result
  end

  def test_it_can_add_ul_and_li_tags
    result = ["Cole", "Matt", "Russell"]
    tagged_result = OrderedListMaker.add_tags(result)
    assert_equal "<ol><li>Cole</li></ol><li>Matt</li></ol><li>Russell</li></ol>", tagged_result
  end

  def test_it_works_as_whole_thing
    result = OrderedListMaker.ordered_list("1. Cole\n2. Matt\n3. Russell\n")
    assert_equal "<ol><li>Cole</li></ol><li>Matt</li></ol><li>Russell</li></ol>", result

  end

end
