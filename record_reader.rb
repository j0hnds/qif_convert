require 'header_line'

module RecordReader

  def create(file)
    [].tap do | records |
      loop do
        records << create_record(file)
        next_line = file.peek_next_line
        break if next_line.nil? || next_line.start_with?(HeaderLine::LEAD_CHARACTER)
      end
    end
  end

end
