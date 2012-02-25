#require_relative 'lib/db'
#
#db = DB::Bootstrap.new
#db.setup

class Word
  def initialize(name, tag)
    @name = name
    @tags = {}
    @tags[tag] = 1
  end

  def add_tag(tag)
    @tags[tag] ||= 0
    @tags[tag] += 1
  end
  def to_s
    "word:#{@name}\ttags:#{@tags}"
  end
end

class Article < Array
  attr :name
  def initialize(name, content)
    @name = name
    @words = {}
    parse_content(content)
  end

  def parse_content(content)
    content.scan(/(([\w<]+)\/([\w>]+)\s)+/).map(&:shift).map{|term| term.split("/")}.each{ |word, tag|
      add_word(word, tag)
    }
  end

  def add_word(word, tag)
    word = word.to_sym
    tag = tag.to_sym
    if @words[word].nil?
      @words[word] = Word.new(word, tag)
    else
      @words[word].add_tag(tag)
      puts "article:#{@name}\t#{@words[word]}"
    end
  end
  #===========================Words array stuff=====================
  def insert(i, v)
    @words[i] = v
  end

  def <<(v)
    @words << v
  end

  def []=(*args)
    @words[args[0]] = args[1]
  end
end



def get_articles(file_name = "full_pos.txt")
  articles = []
  file = File.open(file_name, "r")
  file_content = file.read
  file_content.split("\n").reject(&:empty?).each_slice(2) { |item|
    articles << Article.new(item[0], item[1])
  }
  articles
end


articles = get_articles()