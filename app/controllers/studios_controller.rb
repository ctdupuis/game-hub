class StudiosController < ApplicationController

    get "/studios" do
        @studios = Studio.all
        erb :'studios/index'
    end

    get "/studios/:id" do
        @studio = Studio.find_by(id: params[:id].to_i)
        erb :'studios/show'
    end
end