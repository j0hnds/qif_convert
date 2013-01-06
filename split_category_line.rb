class SplitCategoryLine

  LEADING_CHARACTER = 'S'
  MATCH_RE = /^S(.*)$/

  def self.match(line)
    if line =~ MATCH_RE
      $1
    end
  end

end
