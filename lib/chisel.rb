require_relative 'decider'

class Chisel

  attr_reader :input_file, :output_file

  def initialize(input_file, output_file)
    @input_file  = input_file
    @output_file = output_file
  end

  def turn_markdown_into_html
    markdown = File.read(input_file)
    html = Decider.new(markdown).output_html
    File.write(output_file, html)
    input_count = 0
    File.open(input_file) {|f| input_count = f.read.count("\n")}
    output_count = 0
    File.open(output_file) {|f| output_count = f.read.count("\n")}

    "Converted #{input_file} (#{input_count} lines) to #{output_file} (#{output_count} lines)"
  end
end

if __FILE__  == $PROGRAM_NAME
  chiz = Chisel.new(ARGV[0], ARGV[1])
  $stdout.puts chiz.turn_markdown_into_html
end
 
