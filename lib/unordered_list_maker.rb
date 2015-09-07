class UnorderedListMaker

  def self.unordered_list(line)
    a = line.split("*")
    b = a.map do |e|
      "<li>#{e.strip}</li>"
    end
    c = b.shift
    "<ul>#{b.join}</ul>"
  end


end
