class FlagLine

  LEADING_CHARACTER = 'F'
  MATCH_RE = /^F(.*)$/

  def self.match(line)
    if line =~ MATCH_RE
      $1
    end
  end

end
