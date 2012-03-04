class DateExtractor
  def self.run(article, database)
    years = article.content.scan(/[1-2]{1}[0-9]{3}/).map(&:to_i).sort
    database.tables[:birthYear].add_row([article, years.first, 1]) if years.length>0
    database.tables[:deathYear].add_row([article, years.last, 1]) if years.length>0
  end
end