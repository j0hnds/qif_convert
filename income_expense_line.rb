class IncomeExpenseLine

  MATCH_RE = /^([EI])$/

  def self.match(line)
    line =~ MATCH_RE
  end

end
