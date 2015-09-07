require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/decider'
require 'pry'

class DeciderTest < Minitest::Test

  def test_is_ordered_list_evaluating_to_true
    element = <<-EOF
    1. Adam
    2. Cole
    3. Mimi
    EOF
    d = Decider.new(element)
    assert d.is_ordered_list?(element)
  end

  def test_is_unordered_list_evaluating_to_true
    element = <<-EOF
    * Adam
    * Cole
    * Mimi
    EOF
    d = Decider.new(element)
    assert_equal true, d.is_unordered_list?(element)
  end

  def test_header_is_evaluating_to_true
    element = "# Adam \nGuy in 1507"
    d = Decider.new(element)
    assert_equal true, d.is_header?(element)
  end

  def test_output_html_will_apply_header_tag
    element = "# Adam \n\nGuy in 1507"
    d = Decider.new(element)
    result = d.output_html
    assert_equal "<h1>Adam</h1>\n\n<p>Guy in 1507</p>\n\n", result
  end

  def test_output_html_will_apply_ordered_list_tag
    element = "1. Cole\n2. Matt\n3. Russell\n"
    d = Decider.new(element)
    result = d.output_html
    assert_equal "<ol><li>Cole</li><li>Matt</li><li>Russell</li></ol>", result
  end

  def test_output_html_will_apply_unordered_list_tag
    element = "* first item * second item"
    d = Decider.new(element)
    result = d.output_html
    assert_equal "<ul><li>first item</li><li>second item</li></ul>", result
  end

  def test_it_can_deal_with_all_the_formatting
    element = "# Header 1
    This is the first line of the first paragraph.

    ## Header 2
    This is the first line of the second paragraph.

    * unordered item one
    * unordered item two

    1. ordered item one
    2. ordered item two"

    da = Decider.new(element)
    result_a = da.output_html
    assert_equal "<h1>Header 1\n    This is the first line of the first paragraph.</h1>\n\n<p>    ## Header 2\n    This is the first line of the second paragraph.</p>\n\n<ul><li>unordered item one</li><li>unordered item two</li></ul><ol><li>1.ordereditemone</li><li>2.ordereditemtwo</li></ol>", result_a

  end



end
