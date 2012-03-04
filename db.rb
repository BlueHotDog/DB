require_relative "lib/parsing/doc_parser.rb"
require_relative "lib/text/tf_idf.rb"
require_relative "lib/db/database"
require_relative "lib/text/date_extractor"
require_relative "lib/text/profession"
require_relative "lib/text/born_in"

def preprocess
  puts "======Parsing======"
  DocParser.parse()
  #puts "======Calculating TFIDF======"
  #TfIdf.new(articles).calculate()
end

def read_from_disk
  articles = nil
  File.open('articles') do |f|
    articles = Marshal.load(f)
  end
  articles
end

def save_to_disk
  articles = preprocess
  File.open('articles', 'w+') do |f|
    Marshal.dump(articles, f)
  end
  articles
end


database = Database.new()
articles = save_to_disk
for article in articles do
  DateExtractor.run(article, database)
  Profession.run(article, database)
  BornIn.run(article, database)
end
