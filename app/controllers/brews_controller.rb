class BrewsController < ApplicationController
  def index
    @brews = Unirest.get("http://localhost:3000/api/v1/brews").body
    render 'index.html.erb'
  end

  def create
    
  end

  def show
    @brew = Unirest.get("http://localhost:3000/api/v1/brews/#{params[:id]}").body
    render 'show.html.erb'
  end

  def edit
    @brew = Unirest.get("http://localhost:3000/api/v1/brews/#{params[:id]}")
    render 'edit.html.erb'
  end

  def update
    @brew = Unirest.patch(
      "http://localhost:3000/api/v1/brews/#{params[:id]}",
      parameters: {
        name: params[:name],
        style: params[:style],
        hop: params[:hop],
        yeast: params[:yeast],
        malts: params[:malts],
        ibu: params[:ibu],
        alcohol: params[:alcohol],
        blg: params[:blg],
      }
    ).body
    redirect_to "/brews/#{@brew['id']}"
  end

  def destroy
    
  end

end
