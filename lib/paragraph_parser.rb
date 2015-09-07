class ParagraphParser

  def self.strong(incoming_text)
    while incoming_text.include?("**")
      incoming_text.sub!("**","<strong>")
      incoming_text.sub!("**", "</strong>")
    end
    em_text(incoming_text)
  end

  def self.em_text(incoming_text)
    while incoming_text.include?("*")
      incoming_text.sub!("*", "<em>")
      incoming_text.sub!("*", "</em>")
    end
    add_p_tag(incoming_text)
  end

  def self.add_p_tag(incoming_text)
    incoming_text = "<p>#{incoming_text}</p>\n\n"
  end

end
