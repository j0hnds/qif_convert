class MemoLine

  LEADING_CHARACTER = 'M'
  MATCH_RE = /^M(.*)$/

  def self.match(line)
    if line =~ MATCH_RE
      $1
    end
  end

end
