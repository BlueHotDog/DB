
require_relative 'table'

class Database
  attr :tables
  def initialize
    @tables = {}
    @tables[:birthYear]   = Table.new("year of birth")
    @tables[:deathYear]   = Table.new("year of death")
    @tables[:profession]  = Table.new("profession")
    @tables[:bornIn]      = Table.new("born in")
    @tables[:firstName]   = Table.new("first name")
    @tables[:lastName]    = Table.new("last name")
  end
end