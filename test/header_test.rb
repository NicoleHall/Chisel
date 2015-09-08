require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/header'

class HeaderTest < Minitest::Test

  def test_it_has_a_class
    assert Header
  end

  def test_when_one_hash_a_h1_tag_is_added
    h1 = Header.parse("#Kingdom")
    assert_equal("<h1>Kingdom</h1>\n\n", h1)
  end

  def test_when_two_hash_a_h2_tag_is_added
    h2 = Header.parse("##Phylum")
    assert_equal("<h2>Phylum</h2>\n\n", h2)
  end

  def test_when_three_hash_a_h3_tag_is_added
    h3 = Header.parse("###Class")
    assert_equal("<h3>Class</h3>\n\n", h3)
  end

  def test_when_four_hash_a_h4_tag_is_added
    h4 = Header.parse("####Order")
    assert_equal("<h4>Order</h4>\n\n", h4)
  end

  def test_when_five_hash_a_h5_tag_is_added
    h5 = Header.parse("#####Family")
    assert_equal("<h5>Family</h5>\n\n", h5)
  end



end
