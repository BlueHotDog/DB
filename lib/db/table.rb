class Table
  attr_reader :rows
  def initialize(name)
    @name = name
    @rows = []
  end

  def add_row(row)
    @rows << row
  end
end