require 'record_reader'
require 'name_line'
require 'account_type_line'
require 'record_end_line'

class AccountNameRecord
  extend RecordReader

  attr_reader :name, :type

  def initialize(name, type)
    @name = name
    @type = type
  end

  def self.create_record(file)
    name = NameLine.match file.gets
    raise "Expecting a Name Line in Account Name Record" if name.nil?
    type = AccountTypeLine.match file.gets
    raise "Expecting an account type line in Account Name Record" if type.nil?
    raise "Expecting end of record in Account Name Record" unless RecordEndLine.match file.gets
    self.new(name, type)
  end

end
