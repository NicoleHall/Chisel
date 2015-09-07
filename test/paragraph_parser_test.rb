require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/paragraph_parser'

class ParagraphParserTest < Minitest::Test

  def test_it_has_a_class
    assert ParagraphParser
  end

  def test_it_adds_p_tag
    result = ParagraphParser.add_p_tag("this is line one of graph")
    assert_equal "<p>this is line one of graph</p>\n\n", result
  end

  def test_it_ads_em_tag
    result = ParagraphParser.em_text("this is a *single em* line of graph")
    assert_equal "<p>this is a <em>single em</em> line of graph</p>\n\n", result
  end

  def test_it_add_strong_tag
    result = ParagraphParser.strong("this is a **bold** line of graph")
    assert_equal "<p>this is a <strong>bold</strong> line of graph</p>\n\n", result
  end

end
