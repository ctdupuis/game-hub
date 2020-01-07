class SessionsController < ApplicationController


    get "/login" do
        erb :'/sessions/login'
    end

    post "/login" do
        @user = User.find_by(username: params[:username])
        # binding.pry
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            session[:username] = @user.username
            session[:studio_id] = @user.studio_id
            # binding.pry
            redirect '/users/home'
        end
        redirect '/signup'
    end

    get '/logout' do
        session.clear
        redirect "/"
    end
end