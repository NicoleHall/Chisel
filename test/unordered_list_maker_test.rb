require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/unordered_list_maker'

class ListMakerTest < Minitest::Test

  def test_it_has_a_class
    assert UnorderedListMaker
  end

  def test_it_can_make_an_unordered_list_that_has_one_item
    result = UnorderedListMaker.unordered_list("* first item")
    assert_equal "<ul><li>first item</li></ul>", result
  end

  def test_it_can_make_an_unordered_list_that_has_two_items
    result = UnorderedListMaker.unordered_list("* first item * second item")
    assert_equal "<ul><li>first item</li><li>second item</li></ul>", result
  end



end
