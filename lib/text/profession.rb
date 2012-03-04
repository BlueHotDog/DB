class Profession
  def self.run(article, database)
    results = article.content.scan(/(?:was|is)\/(?:VBD|VBZ)\s((?:a|an|and|one|of|first|most|the|their)\/(?:CD|DT|CC|PRP\$)\s(?:[\w-]+\/[\w]+\s)+)+/)
    first = true
    other_amount = 0.5/results.length unless results.length == 0
    results.each { |result|
      database.tables[:profession].add_row([article, result, first ? 0.5 : other_amount])
      puts "Profession:#{article.name}\t#{result}:#{first ? 0.5 : other_amount}" if article.name.downcase == "adolf hitler"
      first = false
    }
  end
end