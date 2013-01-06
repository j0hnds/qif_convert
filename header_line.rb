class HeaderLine

  LEAD_CHARACTER = '!'
  MATCH_RE = /^!(Account|Type:(Cash|Bank|CCard|Invst|Oth A|Oth L|Liability|Cat|Class|Memorized))$/

  def self.match(line)
    if line =~ MATCH_RE
      $1
    end
  end

end
