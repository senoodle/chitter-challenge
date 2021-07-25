require './lib/database_connection.rb'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter')
else
  
end
