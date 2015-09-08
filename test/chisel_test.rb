require_relative '../lib/chisel'
require 'minitest/autorun'
require 'minitest/pride'

class ChiselTest < Minitest::Test

  def test_it_converts_a_markdown_file_to_html_and_summarizes
    skip
    input_file    = File.expand_path("fixtures/input.md",       __dir__)
    output_file   = File.expand_path("fixtures/output.html",    __dir__)
    expected_file = File.expand_path("fixtures/expected.html",  __dir__)

    chiz    = Chisel.new(input_file, output_file)
    summary = chiz.turn_markdown_into_html

    assert_equal File.read(expected_file).strip,
                 File.read(output_file).strip

    assert_equal "Converted #{input_file} (6 lines) to #{output_file} (8 lines)",
                summary
  end
end
