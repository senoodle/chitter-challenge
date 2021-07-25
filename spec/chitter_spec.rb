require 'chitter'

describe Chitter do

  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter')

      connection.exec("INSERT INTO chitter (peep) VALUES('My first peep.');")
      connection.exec("INSERT INTO chitter (peep) VALUES('My second peep.');")
      connection.exec("INSERT INTO chitter (peep) VALUES('My third peep.');")

      chitters = Chitter.all

      expect(chitters).to include('My first peep.')
      expect(chitters).to include('My second peep.')
      expect(chitters).to include('My third peep.')
    end
  end

  describe '.add' do
    it 'adds a peep' do
      Chitter.add('Add peep')

      expect(Chitter.all).to include 'Add peep'
    end
  end


end
