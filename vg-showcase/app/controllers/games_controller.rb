class GamesController < ApplicationController

    get "/games" do 
        @games = Game.all
        erb :'games/index'
    end

    get "/games/new" do
        erb :'games/new'
    end

    post "/games/:id" do
        # binding.pry
        @studio = Studio.find_by(name: params[:studio])
        if !@studio
            @studio = Studio.create(name: params[:studio])
        end
        @game = Game.create(title: params[:title], genre: params[:genre], description: params[:description], studio_id: @studio.id)
        #NEED TO SET UP SUBMITTED BY FIELD ONCE PASSWORD NONSENSE IS FIGURED OUT
        redirect "/games/#{@game.id}"
    end

    get "/games/:id" do
        @game = Game.find_by(id: params[:id].to_i)
        erb :'games/show'
    end

    get "/games/:id/edit" do
        @game = Game.find_by(id: params[:id].to_i)
        erb :'games/edit'
    end
    
    patch "/games/:id" do
        @game = Game.find_by(id: params[:id].to_i)
        @game.title = params[:title]
        @game.description = params[:description]
        @game.genre = params[:genre]
        @game.save
        # binding.pry
        redirect "/games/#{ @game.id }"
        
    end
    

end