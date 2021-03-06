class GamesController < ApplicationController

    get "/games" do 
        @games = Game.all
        erb :'games/index'
    end

    get "/games/new" do
        erb :'games/new'
    end

    post "/games/:id" do
        @studio = Studio.find_by(id: session[:studio_id])
        @game = Game.create(title: params[:title], genre: params[:genre], description: params[:description], studio_id: @studio.id, submitted_by: session[:username], user_id: session[:user_id])
        redirect "/games/#{@game.id}"
    end

    get "/games/:id" do
        @game = Game.find_by(id: params[:id].to_i)
        @owner = User.find_by(id: @game.id)
        erb :'games/show'
    end

    get "/games/:id/edit" do
        @game = Game.find_by(id: params[:id].to_i)
        if session[:user_id] == @game.user_id
            erb :'games/edit'
        else
            redirect "/games/#{@game.id}"
        end
    end
    
    patch "/games/:id" do
        @game = Game.find_by(id: params[:id].to_i)
        @game.title = params[:title]
        @game.description = params[:description]
        @game.genre = params[:genre]
        @game.user_id = session[:user_id]
        @game.save
        redirect "/games/#{ @game.id }"
        
    end
    
    delete "/games/:id" do
        Game.destroy(params[:id])
        redirect "/users/home"
    end
end