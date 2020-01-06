class RegistrationsController < ApplicationController

    get "/login" do
        erb :'/registrations/login'
    end

    # post "/login" do
        # @user = User.find_by(:username => params[:username])
        # if @user != nil && @user.password == params[:password]
        #     session[:user_id] = @user_id
        #     redirect 'users/home'
        # end
        # redirect 'registrations/signup'
    # end

    get "/signup" do
        erb :'/registrations/signup'
    end

    post "/signup" do 
        @studio = Studio.find_or_create_by(name: params[:studio])
        @username = params[:username]
        @password = params[:password]
        @user = User.find_by(:username => params[:username])
        if !@user
            @user = User.create(username: @username, password: @password, studio: @studio)
            erb :'users/home'
        end
        redirect '/signup'
        # binding.pry
    end
end
