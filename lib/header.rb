class Header

  def self.parse(line)
    num = line.count('#')
    line.delete!('#').strip!
    "<h#{num}>#{line}</h#{num}>\n\n"
  end

end
