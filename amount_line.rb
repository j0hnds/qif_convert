class AmountLine

  LEADING_CHARACTER = 'T'
  MATCH_RE = /^T([+-]?[\d,\.]+)$/

  def self.match(line)
    if line =~ MATCH_RE
      $1
    end
  end

end
