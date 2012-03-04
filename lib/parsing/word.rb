class Word
  attr :name, :indexes, :tfidf
  def initialize(name, tag, index)
    @name = name
    @tags = {}
    @tags[tag] = 1
    @indexes = [index]
  end

  def tfidf=(value)
    @tfidf = value
  end

  def add_tag(tag, index)
    @tags[tag] ||= 0
    @tags[tag] += 1
    @indexes << index
  end

  def to_s
    "word:#{@name}\ttags:#{@tags}\tindexes:#{@indexes}\ttfidf:#{@tfidf}"
  end
end