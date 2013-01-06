require 'record_reader'
require 'name_line'
require 'income_expense_line'
require 'record_end_line'

class CategoryRecord
  extend RecordReader

  attr_reader :name, :type

  def initialize(name, type)
    @name = name
    @type = type
  end

  def self.create_record(file)
    name = NameLine.match file.gets
    raise "Expecting a category name line" if name.nil?
    type = IncomeExpenseLine.match file.gets
    raise "Expecting an Income/Expense type" if type.nil?
    raise "Expecting end of record" unless RecordEndLine.match file.gets

    self.new name, type
  end

end
