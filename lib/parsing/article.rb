class Article
  attr :name, :words, :content, :words_by_index

  def initialize(name, content)
    @name = name
    @words = {}
    @words_by_index = []
    @content = ""
    parse_content(content)
  end

  def parse_content(content)
    index = 0
    @content = content
    content.scan(/([^\/>]+)>?\/(\S+)/).each{ |word, tag|
      add_word(word, tag, index)
      index += 1
    }
  end

  def add_word(word, tag, index)
    word = word.to_sym
    tag = tag.to_sym
    if @words[word].nil?
      @words[word] = Word.new(word, tag, index)
    else
      @words[word].add_tag(tag, index)
    end
    @words_by_index << [word, tag, index]
  end

  def to_s
    puts "====#{@name}====\n"
    for word in @words
      puts "#{word}\n"
    end
    puts "=================\n"
  end
end
