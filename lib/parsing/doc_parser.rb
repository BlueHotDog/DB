require_relative "article"
require_relative "word"
class DocParser
  def self.parse(file_name = "full_pos-short.txt")
    articles = []
    File.open(file_name, "r").read.split("\n").reject(&:empty?).each_slice(2) { |item|
      articles << Article.new(item[0], item[1])
    }
    articles
  end
end