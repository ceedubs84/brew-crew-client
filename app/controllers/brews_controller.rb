class BrewsController < ApplicationController
  HEADERS = { 'Authorization' => "Token token=#{ENV['API_KEY']}", 'X-User-Email' => ENV['API_EMAIL']}
  def index
    @brews = Unirest.get(
      "#{ENV['API_BASE_URL']}",
      headers: HEADERS
      ).body
    render 'index.html.erb'
  end

  def create
    @brew = Unirest.post(
      "#{ENV['API_BASE_URL']}/brews",
      headers: HEADERS,
      parameters: {
        name: params[:name],
        style: params[:style],
        hop: params[:hop],
        yeast: params[:yeast],
        malts: params[:malts],
        ibu: params[:ibu],
        alcohol: params[:alcohol],
        blg: params[:blg]
      }
    ).body
    redirect_to "/brews/#{@brew["id"]}"
  end

  def show
    @brew = Unirest.get(
      "#{ENV['API_BASE_URL']}/brews/#{params[:id]}",
      headers: HEADERS,
    ).body
    render 'show.html.erb'
  end

  def edit
    @brew = Unirest.get(
      "#{ENV['API_BASE_URL']}/employees/#{params[:id]}",
      headers: HEADERS,
    ).body
    render 'edit.html.erb'
  end

  def update
    @brew = Unirest.patch(
      "#{ENV['API_BASE_URL']}/brews/#{params[:id]}",
      headers: HEADERS,
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
    message = Unirest.delete(
      "#{ENV['API_BASE_URL']}/brews/#{params[:id]}",
      headers: HEADERS
    ).body
    redirect_to "/brews"
  end

end