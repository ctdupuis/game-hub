class RegistrationsController < ApplicationController

    get "/signup" do
        @studios = Studio.all
        erb :'/registrations/signup'
    end

    get "/signup2" do
        @studios = Studio.all
        erb :'/registrations/signup2'
    end

    post "/signup" do 
        flash[:taken] = "Username already exists"
        flash[:username] = "Username must be at least 4 characters, alphanumeric only"
        flash[:password] = "Password must be at least 4 characters"
        @finduser = User.find_by(:username => params[:username])
        if @finduser
            redirect '/signup'
        end
        if Helpers.validate_user(params[:username]) && Helpers.validate_studio(params[:studio]) && Helpers.validate_length(params[:password])
            @username = params[:username]
            @password = params[:password]
            
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
