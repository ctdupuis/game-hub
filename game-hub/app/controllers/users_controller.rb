class UsersController < ApplicationController

    get "/home" do
      @current_user = User.find_by_id(session[:user_id])
      if @current_user
          erb :'users/home'
      else
          erb :'users/error'
      end
    end
    
end
