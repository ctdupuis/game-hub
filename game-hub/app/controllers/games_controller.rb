class GamesController < ApplicationController

    get "/games" do 
        @games = Game.all
        erb :'games/index'
    end

    get "/games/:id" do
        @game = Game.find_by(id: params[:id].to_i)
        # binding.pry
        erb :'games/show'
    end

    get "/new" do
        erb :'games/new'
    end


end