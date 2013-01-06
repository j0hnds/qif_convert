class PayeeLine

  LEADING_CHARACTER = 'P'
  MATCH_RE = /^P(.*)$/

  def self.match(line)
    if line =~ MATCH_RE
      $1
    end
  end

end
