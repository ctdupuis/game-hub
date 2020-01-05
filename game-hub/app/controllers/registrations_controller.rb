class RegistrationsController < ApplicationController

    get "/login" do
        erb :'/registrations/login'
    end

    # post "/login" do
        
    # end

    get "/signup" do
        erb :'/registrations/signup'
    end

    post "/signup" do 
        @company = Studio.find_or_create_by(name: params["studio"])
        @username = params[:username]
        @password = params[:password]
        @user = User.create(username: @username, password: @password, studio: @company)
        erb :'users/home'
        # binding.pry
    end
end
