class UsersController < ApplicationController

    get "/users/home" do
        @user = User.find_by(id: session[:user_id])
        erb :'users/home'
    end

    get "/users/:id" do
        @user = User.find_by(id: params[:id])
        erb :'users/show'
    end

end