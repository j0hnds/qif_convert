require 'buffered_file'
require 'header_line'

require 'account_name_record'
require 'category_record'
require 'bank_record'

class QifReader

  RECORD_MAPPING = {
    'Account' => AccountNameRecord,
    'Type:Cat' => CategoryRecord,
    'Type:Bank' => BankRecord
  }

  def initialize(file)
    @file = BufferedFile.new file
  end

  def read
    data = {}
    while !(line = @file.gets).nil?
      raise "Expecting a header line at this point!: #{line}" unless line.start_with?(HeaderLine::LEAD_CHARACTER)
      record_type = HeaderLine.match line
      raise "Expected a valid header line at this point!: #{line}" if record_type.nil?

      record_class = RECORD_MAPPING[record_type]
      raise "Expected a valid record type. Got #{record_type}" if record_class.nil?

      data[record_type] = record_class.create @file
    end
    data
  end

end
