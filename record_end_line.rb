class RecordEndLine

  LEADING_CHARACTER = '^'
  MATCH_RE = /^\^$/

  def self.match(line)
    line =~ MATCH_RE
  end

end
