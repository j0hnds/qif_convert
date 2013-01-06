class BufferedFile

  def initialize(file)
    @file = file
    @line_buffer = []
  end

  def gets
    line = @line_buffer.pop
    (line.nil?) ? @file.gets : line
  end

  def push(line)
    @line_buffer.push line
  end

  def peek_next_line
    next_line = @line_buffer.last
    if next_line.nil?
      next_line = @file.gets
      @line_buffer.push next_line unless next_line.nil?
    end
    next_line
  end

end
