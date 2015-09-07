class OrderedListMaker

  def self.ordered_list(line)
    a = line.split("\n")
    b = a.map do |list_item|
      list_item.delete(list_item[0..1]).strip
    end
    c = b.map do |e|
      "<li>#{e}</li>"
    end
    d = c.join
    "<ol>#{d}</ol>"
  end

end
