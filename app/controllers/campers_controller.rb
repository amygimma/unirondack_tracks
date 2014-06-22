class CampersController < ApplicationController
  def show
  end

  def index
    @campers = Camper.all
  end
end
