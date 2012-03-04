class Names

  def self.run(article, database)
    names = article.name.split(" ").to_a
    first = names.first
    names.shift()
    last = names.join(" ")
    database.tables[:firstName].add_row([article, first, 1])
    database.tables[:lastName].add_row([article, last, 1])
    #puts "Names: first:#{first}\tlast:#{last}" if article.name.downcase == "adolf hitler"
  end
end