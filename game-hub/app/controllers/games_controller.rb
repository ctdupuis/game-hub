class GamesController < ApplicationController

    get "/new" do
        erb :'games/new'
    end


end