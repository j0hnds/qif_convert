class AccountTypeLine

  LEADING_CHARACTER = 'T'
  MATCH_RE = /^T(.*)$/

  def self.match(line)
    if line =~ MATCH_RE
      $1
    end
  end

end
