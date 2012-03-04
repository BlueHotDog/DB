class WhenBorn
  def self.run(name, database)
    name.downcase!
    results = []
    for row in database.tables[:birthYear].rows
      if row[0].name.downcase==name
        results << row
      end
    end
    found = results.sort_by { |result| result[2]}.first()
    found[1] unless found.nil?
  end
end