class SplitMemoLine

  LEADING_CHARACTER = 'E'
  MATCH_RE = /^E(.*)$/

  def self.match(line)
    if line =~ MATCH_RE
      $1
    end
  end

end
