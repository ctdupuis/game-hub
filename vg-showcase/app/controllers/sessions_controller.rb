class SessionsController < ApplicationController

    get "/login" do
        erb :'/sessions/login'
    end

    post "/login" do
        @current_user = User.find_by(username: params[:username])
        if @current_user && @current_user.authenticate(params[:password])
            session[:user_id] = @current_user.id
            session[:username] = @current_user.username
            session[:studio_id] = @current_user.studio_id
            redirect '/users/home'
        end
        redirect '/signup'
    end

    get '/logout' do
        session.clear
        redirect "/"
    end

end