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
        binding.pry
    end
end
