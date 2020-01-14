require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, "l3kj465hkj543"
  end

  get "/" do
    @games = Game.all 
    @studios = Studio.all
    erb :welcome
  end

end
