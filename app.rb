require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Hey"
  end

  get '/peeps' do
    @peeps = Chitter.all
    erb :index
  end

  get '/submitpeep' do
    erb :submitpeep
  end

  post '/peeps' do
    @peep = params[:peep]
    Chitter.add(@peep)
    redirect '/peeps'
  end


  run! if app_file == $0
end
