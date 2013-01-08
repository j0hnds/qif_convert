#!/usr/bin/env ruby
#
# Read the specified QIF file and dump the categories we find

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
  csv_out << %w{ category, type }
  data_hash['Type:Cat'].each do | category |
    csv_out << [ category.name, category.type ]
  end
end
