class CheckNumberLine
  
  LEADING_CHARACTER = 'N'
  MATCH_RE = /^N(\d+|Deposit|Transfer|Print|ATM|EFT)$/

  def self.match(line)
    if line =~ MATCH_RE
      $1
    end
  end

end
