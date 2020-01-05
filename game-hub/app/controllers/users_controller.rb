class UsersController < ApplicationController

    get "/home" do
        erb :'users/home'
    end
    
end