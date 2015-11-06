class OrderedListMaker

  def self.ordered_list(line)
    add_tags(formatted(line))
  end

  def self.formatted(line)
    line.split("\n").map do |list_item|
      list_item.delete(list_item[0..1]).strip
    end
  end

  def self.add_tags(input)
    "<ol>#{input.map do |e|
    "<li>#{e}</li></ol>"
    end.join}"
  end

end
