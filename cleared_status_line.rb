class ClearedStatusLine

  # Blank value - not cleared
  # * or c - cleared
  # X or R - reconciled
  LEADING_CHARACTER = 'C'
  MATCH_RE = /^C([ *cXR]?)$/

  def self.match(line)
    if line =~ MATCH_RE
      $1
    end
  end

end
