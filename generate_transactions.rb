#!/usr/bin/env ruby
#
# Read the specified QIF file and dump the banking transactions we find

$:.unshift File.dirname(__FILE__)

require 'csv'
require 'qif_reader'

raise "Must specify a QIF file!" if ARGV.empty?

QIF_FILE = ARGV.first

data_hash = nil

File.open(QIF_FILE, 'r') do |f|
  reader = QifReader.new(f)
  data_hash = reader.read
end

CSV do |csv_out|
  csv_out << %w{ date amount cleared payee category memo check_number splits }
  data_hash['Type:Bank'].each do | transaction |
    csv_out << [ 
                transaction.date,
                transaction.transaction_amount,
                transaction.cleared_flag,
                transaction.payee,
                transaction.category,
                transaction.memo,
                transaction.check_number,
                transaction.splits.size
               ]
  end
end
