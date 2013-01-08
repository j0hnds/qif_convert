class IncomeExpenseLine

  MATCH_RE = /^([EI])$/

  def self.match(line)
    if line =~ MATCH_RE
      $1
    end
  end

end
