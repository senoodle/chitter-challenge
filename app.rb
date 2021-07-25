require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "The Chitter App"
  end

  get '/submitpeep' do
    erb :'submitpeep'
  end

  get '/peeps' do
    @peeps = Peep.all
    p @peeps
    erb :'index'
  end

  post '/peeps' do
    Peep.add(content: params[:peep])
    redirect '/peeps'
  end

  run! if app_file == $0
end
