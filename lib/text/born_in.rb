class BornIn
  def self.run(article, database)
    born_at = /(?:(?:born)\/(?:VBN)\s)?(?:[\w])+\/(?:IN)\s((?:(?:[A-Z]{1}(?:[\w]|[^A-Za-z0-9 \n'\/`.,-:$\\!;%*#()+\-@\^\?\&])+)\/(?:NNP)\s)+)/
    results = article.content.scan(born_at)
    first = true
    other_amount = 0.5/results.length unless results.length == 0
    results.each { |result|
      database.tables[:bornIn].add_row([article, result, first ? 0.5 : other_amount])
      puts "BornIn:#{article.name}\t#{result}:#{first ? 0.5 : other_amount}" if article.name.downcase == "adolf hitler"
      first = false
    }
  end
end