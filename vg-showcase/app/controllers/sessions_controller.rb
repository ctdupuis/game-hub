class SessionsController < ApplicationController


    get "/login" do
        erb :'/sessions/login'
    end

    post "/login" do
        @user = User.find_by(username: params[:username])
        # binding.pry
        if @user != nil && @user.password == params[:password]
            session[:user_id] = @user_id
            redirect '/users/home'
        end
        redirect '/signup'
    end

    get '/logout' do
        session.clear
        redirect "/"
    end
end