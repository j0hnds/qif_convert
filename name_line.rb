class NameLine

  LEADING_CHARACTER = 'N'
  MATCH_RE = /^N(.*)$/

  def self.match(line)
    if line =~ MATCH_RE
      $1
    end
  end

end
