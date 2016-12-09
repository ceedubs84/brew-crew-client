class BrewsController < ApplicationController
  def index

  end

  def show
    @brew = Unirest.get("http://localhost:3000/api/v1/employees/#{params[:id]}").body
  end
end
