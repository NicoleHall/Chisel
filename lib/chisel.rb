require 'decider'

class Chisel

  def initialize(argv0, argv1)
    turn_my_markdown_into_html
  end

  def turn_my_markdown_into_html
    handle = File.read('../files_for_reading_and_writing/markdown_input.md')
    handle.read

  end

end
