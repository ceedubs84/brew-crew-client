class BrewsController < ApplicationController
  def index
    @brews = Unirest.get("http://localhost:3000/api/v1/brews").body
    render 'index.html.erb'
  end

  def show
    @brew = Unirest.get("http://localhost:3000/api/v1/brews/#{params[:id]}").body
    render 'show.html.erb'
  end

end
