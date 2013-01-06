class AddressLine

  LEADING_CHARACTER = 'A'
  MATCH_RE = /^A(.*)$/

  def self.match(line)
    if line =~ MATCH_RE
      $1
    end
  end

end
