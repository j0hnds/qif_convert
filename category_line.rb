class CategoryLine

  LEADING_CHARACTER = 'L'
  MATCH_RE = /^L(.*)$/

  def self.match(line)
    if line =~ MATCH_RE
      $1
    end
  end

end
