class SplitAmountLine

  LEADING_CHARACTER = '$'
  MATCH_RE = /^\$(.*)$/

  def self.match(line)
    if line =~ MATCH_RE
      $1
    end
  end
end
