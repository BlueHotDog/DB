require_relative "lib/parsing/doc_parser.rb"
require_relative "lib/text/tf_idf.rb"
require_relative "lib/db/database"
require_relative "lib/text/date_extractor"

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
DateExtractor.new(articles, database)
for row in database.tables[:birthYear].rows do
  puts "#{row[0].name}:\t#{row[1]}"
end
