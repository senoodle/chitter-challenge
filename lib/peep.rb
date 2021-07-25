require 'pg'

class Peep

  attr_reader :peep

  def self.all

    result =  DatabaseConnection.query('SELECT * FROM chitter;')

    result.map { |chitter| chitter['peep'] }
  end

  def self.add(peep)

    DatabaseConnection.query("INSERT INTO chitter (peep) VALUES ('#{peep}')")
  end

end
