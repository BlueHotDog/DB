class FirstName
  def initialize(db, articles, table)
    for article in articles do
      if article.name == "Karl Marx"
        article.words_by_index.each do |word|
          puts word
        end
      end
    end
  end
end