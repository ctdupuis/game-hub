class RegistrationsController < ApplicationController

    

    get "/signup" do
        erb :'/registrations/signup'
    end

    post "/signup" do 
        flash[:error] = "Please try again"
        if params[:username] =~ /^[A-Z0-9]+$/i
            @username = params[:username] 
            @password = params[:password]
            @finduser = User.find_by(:username => params[:username])
            @studio = Studio.find_or_create_by(name: params[:studio])
        else
            redirect '/signup'
        end

        if !@finduser
            @user = User.create(username: @username, password: @password, studio: @studio)
            session[:user_id] = @user.id
            session[:username] = @user.username
            session[:studio_id] = @user.studio_id
            redirect '/users/home'
        end
        redirect '/signup'
        
    end
end
