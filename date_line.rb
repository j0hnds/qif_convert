class DateLine

  LEAD_CHARACTER = 'D'
  MATCH_RE = /^D(\d{2}\.\d{2}\.\d{4})$/

  def self.match(line)
    if line =~ MATCH_RE
      $1
    end
  end

end
