require 'pg'

class Chitter

  attr_reader :peep
  
  def self.all

    connection = PG.connect(dbname: 'chitter')

    chitter = connection.exec('SELECT * FROM chitter;')

    chitter.map { |chitter| chitter['peep'] }
  end

  def self.add(peep)
    connection = PG.connect(dbname: 'chitter')

    connection.exec("INSERT INTO chitter (peep) VALUES ('#{peep}')")
  end

end
