require_relative './header'
require_relative './paragraph_parser'
require_relative './unordered_list_maker'
require_relative './ordered_list_maker'
require 'pry'

class Decider

  attr_reader :markdown_elements

  def initialize(incoming_markdown)
    @markdown_elements = incoming_markdown.split("\n\n")
  end


  def is_ordered_list?(element)
    ((element.strip[0][0].to_i) > 0)
  end

  def is_unordered_list?(element)
    (element.strip[0..1]) == "* "
  end

  def is_header?(element)
    (element[0..1]) == "# "
  end

  def output_html
    @markdown_elements.map do |element|
      if is_header?(element)
        Header.parse(element)
      elsif is_ordered_list?(element)
          OrderedListMaker.ordered_list(element)
        elsif is_unordered_list?(element)
            UnorderedListMaker.unordered_list(element)
      else
        ParagraphParser.strong(element)
      end
    end.join
  end

end
