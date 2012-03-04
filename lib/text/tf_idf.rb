class TfIdf
  def initialize(documents)
    @documents = documents
    @words_cache = {}
  end

  def word_in_document(doc, word)
    doc.words[word][:indexes].length
  end

  def total_in_all_docs(word)
    amount = 0
    return @words_cache[word] unless @words_cache[word].nil?
    @documents.each do |doc|
      amount += 1 unless doc.words[word].nil?
    end
    @words_cache[word] = amount
    amount
  end

  def calculate
    @documents.each do |document|
      document.words.each do |word|
        tf = word[1].indexes.length
        containing_the_word = total_in_all_docs(word[0])
        idf = Math.log10(@documents.length / containing_the_word)
        word[1].tfidf = tf*idf
      end
    end
  end
end