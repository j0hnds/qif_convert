require 'record_reader'
require 'date_line'
require 'memo_line'
require 'amount_line'
require 'cleared_status_line'
require 'check_number_line'
require 'payee_line'
require 'category_line'
require 'split_category_line'
require 'split_amount_line'
require 'split_memo_line'
require 'record_end_line'

class Split
  
  attr_accessor :category, :memo, :amount

  def initialize(category)
    @category = category
  end

end

class BankRecord
  extend RecordReader

  attr_accessor :date, :transaction_amount, :cleared_flag, :payee, :category, :memo
  attr_accessor :check_number, :splits

  def initialize(date)
    @date = date
    @splits = []
  end

  def self.create_record(file)
    date = DateLine.match file.gets
    raise "Expecting a date line" if date.nil?

    bank_record = self.new date

    # Now, get the rest of the bank information
    loop do
      next_line = file.gets
      break if next_line.nil?

      case next_line[0]
      when MemoLine::LEADING_CHARACTER
        bank_record.memo = MemoLine.match next_line

      when AmountLine::LEADING_CHARACTER
        bank_record.transaction_amount = AmountLine.match next_line

      when ClearedStatusLine::LEADING_CHARACTER
        bank_record.cleared_flag = ClearedStatusLine.match next_line

      when CheckNumberLine::LEADING_CHARACTER
        bank_record.check_number = CheckNumberLine.match next_line

      when PayeeLine::LEADING_CHARACTER
        bank_record.payee = PayeeLine.match next_line

      when CategoryLine::LEADING_CHARACTER
        bank_record.category = CategoryLine.match next_line

      when SplitCategoryLine::LEADING_CHARACTER
        bank_record.splits << Split.new(SplitCategoryLine.match next_line)
        
      when SplitAmountLine::LEADING_CHARACTER
        split = bank_record.splits.last
        raise "Expecting there to be a split" if split.nil?
        split.amount = SplitAmountLine.match next_line

      when SplitMemoLine::LEADING_CHARACTER
        split = bank_record.splits.last
        raise "Expecting there to be a split" if split.nil?
        split.memo = SplitMemoLine.match next_line
        
      when RecordEndLine::LEADING_CHARACTER
        break

      else
        raise "Unexpected record line: #{next_line}"
      end
    end

    bank_record
  end

end
